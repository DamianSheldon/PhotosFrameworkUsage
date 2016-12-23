//
//  AssetViewController.swift
//  PhotosFrameworkUsage
//
//  Created by DongMeiliang on 22/12/2016.
//  Copyright © 2016 Meiliang Dong. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

class AssetViewController: UIViewController {

    // MARK: Properties
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var favoriteButton: UIBarButtonItem!
    var space: UIBarButtonItem!
    var trashButton: UIBarButtonItem!
    
    var asset: PHAsset!
    
    fileprivate lazy var formatIdentifier = Bundle.main.bundleIdentifier!
    fileprivate let formatVersion = "1.0"
    fileprivate lazy var ciContext = CIContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(respondsToEditButton(_ :)))
        
        view.addSubview(imageView)
        configureConstraintsForImageView()
        
        favoriteButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(respondsToFavoriteButton))
        favoriteButton.isEnabled = asset.canPerform(.properties)
        favoriteButton.title = asset.isFavorite ? "♥︎" : "♡"
        
        space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(respondsToTrashButton))
        trashButton.isEnabled = asset.canPerform(.delete)
        
        toolbarItems = [favoriteButton, space, trashButton]
        navigationController?.isToolbarHidden = false
        
        updateStaticImage()
        
        PHPhotoLibrary.shared().register(self)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    @objc func respondsToFavoriteButton() -> Void {
        PHPhotoLibrary.shared().performChanges({
            let request = PHAssetChangeRequest(for: self.asset)
            request.isFavorite = !self.asset.isFavorite
        }, completionHandler: { success, error in
            if success {
                DispatchQueue.main.sync {
                    self.favoriteButton.title = self.asset.isFavorite ? "♥︎" : "♡"
                }
                print("set favorite property successfully!")
            }
            else {
                print("can't set favorite: \(error)")
            }
        })
    }
    
    @objc func respondsToTrashButton() -> Void {
        PHPhotoLibrary.shared().performChanges({ 
            PHAssetChangeRequest.deleteAssets([self.asset] as NSArray)
        }) { (success, error) in
            DispatchQueue.main.sync {
                self.trashButton.isEnabled = success ? false : true
            }
            
            if success {
                print("delete asset successfully")
            }
            else {
                print("can't delete asset: \(error)")
            }
        }
    }
    
    @objc func respondsToEditButton(_ sender: UIBarButtonItem) {
        // Use a UIAlertController to display editing options to the user.
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        #if os(iOS)
            alertController.modalPresentationStyle = .popover
            if let popoverController = alertController.popoverPresentationController {
                popoverController.barButtonItem = sender
                popoverController.permittedArrowDirections = .up
            }
        #endif
        
        // Add a Cancel action to dismiss the alert without doing anything.
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""),
                                                style: .cancel, handler: nil))
        
        // Allow editing only if the PHAsset supports edit operations.
        if asset.canPerform(.content) {
            // Add actions for some canned filters.
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Sepia Tone", comment: ""),
                                                    style: .default, handler: getFilter("CISepiaTone")))
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Chrome", comment: ""),
                                                    style: .default, handler: getFilter("CIPhotoEffectChrome")))

        }
        // Present the UIAlertController.
        present(alertController, animated: true)
    }
    
    // MARK: Private Methods
    func configureConstraintsForImageView() -> Void {
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0))
    }
    
    var targetSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: view.bounds.width * scale,
                      height: view.bounds.height * scale)
    }
    
    func updateStaticImage() {
        // Prepare the options to pass when fetching the (photo, or video preview) image.
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isNetworkAccessAllowed = false
        
        PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { image, _ in
            
            // If successful, show the image view and display the image.
            guard let image = image else { return }
            
            self.imageView.isHidden = false
            self.imageView.image = image
        })
    }
    
    // Returns a filter-applier function for the named filter, to be passed as a UIAlertAction handler
    func getFilter(_ filterName: String) -> (UIAlertAction) -> () {
        func applyFilter(_: UIAlertAction) {
            // Set up a handler to make sure we can handle prior edits.
            let options = PHContentEditingInputRequestOptions()
            options.canHandleAdjustmentData = {
                $0.formatIdentifier == self.formatIdentifier && $0.formatVersion == self.formatVersion
            }
            
            // Prepare for editing.
            asset.requestContentEditingInput(with: options, completionHandler: { input, info in
                guard let input = input
                    else { fatalError("can't get content editing input: \(info)") }
                
                // This handler gets called on the main thread; dispatch to a background queue for processing.
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    // Create adjustment data describing the edit.
                    let adjustmentData = PHAdjustmentData(formatIdentifier: self.formatIdentifier,
                                                          formatVersion: self.formatVersion,
                                                          data: filterName.data(using: .utf8)!)
                    
                    /* NOTE:
                     This app's filter UI is fire-and-forget. That is, the user picks a filter,
                     and the app applies it and outputs the saved asset immediately. There's
                     no UI state for having chosen but not yet committed an edit. This means
                     there's no role for reading adjustment data -- you do that to resume
                     in-progress edits, and this sample app has no notion of "in-progress".
                     
                     However, it's still good to write adjustment data so that potential future
                     versions of the app (or other apps that understand our adjustement data
                     format) could make use of it.
                     */
                    
                    // Create content editing output, write the adjustment data.
                    let output = PHContentEditingOutput(contentEditingInput: input)
                    output.adjustmentData = adjustmentData
                    
                    // Select a filtering function for the asset's media type.
                    let applyFunc: (String, PHContentEditingInput, PHContentEditingOutput, @escaping () -> ()) -> ()
                    if #available(iOS 9.1, *) {
                        if self.asset.mediaSubtypes.contains(.photoLive) {
                            applyFunc = self.applyLivePhotoFilter
                        } else if self.asset.mediaType == .image {
                            applyFunc = self.applyPhotoFilter
                        } else {
                            applyFunc = self.applyVideoFilter
                        }
                    } else {
                        // Fallback on earlier versions
                        if self.asset.mediaType == .image {
                            applyFunc = self.applyPhotoFilter
                        } else {
                            applyFunc = self.applyVideoFilter
                        }
                    }
                    
                    // Apply the filter.
                    applyFunc(filterName, input, output, {
                        // When rendering is done, commit the edit to the Photos library.
                        PHPhotoLibrary.shared().performChanges({
                            let request = PHAssetChangeRequest(for: self.asset)
                            request.contentEditingOutput = output
                        }, completionHandler: { success, error in
                            if !success { print("can't edit asset: \(error)") }
                        })
                    })
                }
            })
        }
        return applyFilter
    }
    
    func applyPhotoFilter(_ filterName: String, input: PHContentEditingInput, output: PHContentEditingOutput, completion: () -> ()) {
        
        // Load the full size image.
        guard let inputImage = CIImage(contentsOf: input.fullSizeImageURL!)
            else { fatalError("can't load input image to edit") }
        
        // Apply the filter.
        let outputImage = inputImage
            .applyingOrientation(input.fullSizeImageOrientation)
            .applyingFilter(filterName, withInputParameters: nil)
        
        // Write the edited image as a JPEG.
        do {
            if #available(iOS 10.0, *) {
                try self.ciContext.writeJPEGRepresentation(of: outputImage,
                                                           to: output.renderedContentURL, colorSpace: inputImage.colorSpace!, options: [:])
            }
            else {
                // Fallback on earlier versions
                
                if let cgImage = CIContext(options: nil).createCGImage(outputImage, from: outputImage.extent) {
                    // init(cgImage: CGImage)
//                    let uiImage = UIImage(ciImage: outputImage)
                    let uiImage = UIImage(cgImage: cgImage)

                    // NSData * UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality);
                    if let data = UIImageJPEGRepresentation(uiImage, 0.7) {
                        // NSData - (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;
                        do {
                            try data.write(to: output.renderedContentURL)
                            
                        } catch let error {
                            print("output filtered image to specify URL failed: \(error)")
                        }
                    }
                    else {
                        print("generate JPEG representation data failed")
                        return
                    }
                }
                else {
                    print("instance CGImage failed")
                    return
                }
                
            }
        } catch let error {
            fatalError("can't apply filter to image: \(error)")
        }
        completion()
    }
    
    func applyLivePhotoFilter(_ filterName: String, input: PHContentEditingInput, output: PHContentEditingOutput, completion: @escaping () -> ()) {
        
        // This app filters assets only for output. In an app that previews
        // filters while editing, create a livePhotoContext early and reuse it
        // to render both for previewing and for final output.
        if #available(iOS 10.0, *) {
            guard let livePhotoContext = PHLivePhotoEditingContext(livePhotoEditingInput: input)
                else { fatalError("can't get live photo to edit") }
            livePhotoContext.frameProcessor = { frame, _ in
                return frame.image.applyingFilter(filterName, withInputParameters: nil)
            }
            livePhotoContext.saveLivePhoto(to: output) { success, error in
                if success {
                    completion()
                } else {
                    print("can't output live photo")
                }
            }
        } else {
            // Fallback on earlier versions
            
        }
    }
    
    func applyVideoFilter(_ filterName: String, input: PHContentEditingInput, output: PHContentEditingOutput, completion: @escaping () -> ()) {
        // Load AVAsset to process from input.
        if #available(iOS 9.0, *) {
            guard let avAsset = input.audiovisualAsset
                else { fatalError("can't get AV asset to edit") }
            // Set up a video composition to apply the filter.
            let composition = AVVideoComposition(
                asset: avAsset,
                applyingCIFiltersWithHandler: { request in
                    let filtered = request.sourceImage.applyingFilter(filterName, withInputParameters: nil)
                    request.finish(with: filtered, context: nil)
            })
            
            // Export the video composition to the output URL.
            guard let export = AVAssetExportSession(asset: avAsset, presetName: AVAssetExportPresetHighestQuality)
                else { fatalError("can't set up AV export session") }
            export.outputFileType = AVFileTypeQuickTimeMovie
            export.outputURL = output.renderedContentURL
            export.videoComposition = composition
            export.exportAsynchronously(completionHandler: completion)

        } else {
            // Fallback on earlier versions
        }
    }

}

extension AssetViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changeDetails = changeInstance.changeDetails(for: asset) else { return }
        
        DispatchQueue.main.sync {
            if changeDetails.objectWasDeleted {
                self.imageView.image = nil
            }
            else if changeDetails.assetContentChanged {
                asset = changeDetails.objectAfterChanges as! PHAsset
                
                updateStaticImage()
            }
        }
    }
}
