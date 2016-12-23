//
//  FetchingViewController.swift
//  PhotosFrameworkUsage
//
//  Created by DongMeiliang on 21/12/2016.
//  Copyright © 2016 Meiliang Dong. All rights reserved.
//

import UIKit
import Photos
import PhotosUI
/*
 type: Optional("album"), subType: Optional("albumRegular") collection list count: 0
 
 type: Optional("album"), subType: Optional("albumSyncedEvent") collection list count: 0
 
 type: Optional("album"), subType: Optional("albumSyncedFaces") collection list count: 0
 
 type: Optional("album"), subType: Optional("albumSyncedAlbum") collection list count: 0
 
 type: Optional("album"), subType: Optional("albumImported") collection list count: 0
 
 type: Optional("album"), subType: Optional("albumMyPhotoStream") collection list count: 0
 
 type: Optional("album"), subType: Optional("albumCloudShared") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumGeneric") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumPanoramas") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumVideos") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumFavorites") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumTimelapses") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumAllHidden") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumRecentlyAdded") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumBursts") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumSlomoVideos") collection list count: 0
 
 type: Optional("album"), subType: Optional("smartAlbumUserLibrary") collection list count: 0
 
 type: Optional("album"), subType: Optional("any") collection list count: 0
 
 type: Optional("smartAlbum"), subType: Optional("albumRegular") collection list count: 12
 
 type: Optional("smartAlbum"), subType: Optional("albumSyncedEvent") collection list count: 12
 
 type: Optional("smartAlbum"), subType: Optional("albumSyncedFaces") collection list count: 12
 
 type: Optional("smartAlbum"), subType: Optional("albumSyncedAlbum") collection list count: 12
 
 type: Optional("smartAlbum"), subType: Optional("albumImported") collection list count: 12
 
 type: Optional("smartAlbum"), subType: Optional("albumMyPhotoStream") collection list count: 12
 
 type: Optional("smartAlbum"), subType: Optional("albumCloudShared") collection list count: 12
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumGeneric") collection list count: 0
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumPanoramas") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumVideos") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumFavorites") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumTimelapses") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumAllHidden") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumRecentlyAdded") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumBursts") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumSlomoVideos") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("smartAlbumUserLibrary") collection list count: 1
 
 type: Optional("smartAlbum"), subType: Optional("any") collection list count: 11
 
 type: Optional("moment"), subType: Optional("albumRegular") collection list count: 15
 
 type: Optional("moment"), subType: Optional("albumSyncedEvent") collection list count: 15
 
 type: Optional("moment"), subType: Optional("albumSyncedFaces") collection list count: 15
 
 type: Optional("moment"), subType: Optional("albumSyncedAlbum") collection list count: 15
 
 type: Optional("moment"), subType: Optional("albumImported") collection list count: 15
 
 type: Optional("moment"), subType: Optional("albumMyPhotoStream") collection list count: 15
 
 type: Optional("moment"), subType: Optional("albumCloudShared") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumGeneric") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumPanoramas") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumVideos") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumFavorites") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumTimelapses") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumAllHidden") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumRecentlyAdded") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumBursts") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumSlomoVideos") collection list count: 15
 
 type: Optional("moment"), subType: Optional("smartAlbumUserLibrary") collection list count: 15
 
 type: Optional("moment"), subType: Optional("any") collection list count: 15
 
 
 ============================================================
 
 type: Optional("momentList"), subType: Optional("momentListCluster") collection list count: 11
 
 type: Optional("momentList"), subType: Optional("momentListYear") collection list count: 1
 
 type: Optional("momentList"), subType: Optional("regularFolder") collection list count: 0
 
 type: Optional("momentList"), subType: Optional("smartFolderEvents") collection list count: 0
 
 type: Optional("momentList"), subType: Optional("smartFolderFaces") collection list count: 0
 
 type: Optional("momentList"), subType: Optional("any") collection list count: 12
 
 type: Optional("folder"), subType: Optional("momentListCluster") collection list count: 0
 
 type: Optional("folder"), subType: Optional("momentListYear") collection list count: 0
 
 type: Optional("folder"), subType: Optional("regularFolder") collection list count: 0
 
 type: Optional("folder"), subType: Optional("smartFolderEvents") collection list count: 0
 
 type: Optional("folder"), subType: Optional("smartFolderFaces") collection list count: 0
 
 type: Optional("folder"), subType: Optional("any") collection list count: 0
 
 type: Optional("smartFolder"), subType: Optional("momentListCluster") collection list count: 0
 
 type: Optional("smartFolder"), subType: Optional("momentListYear") collection list count: 0
 
 type: Optional("smartFolder"), subType: Optional("regularFolder") collection list count: 0
 
 type: Optional("smartFolder"), subType: Optional("smartFolderEvents") collection list count: 1
 
 type: Optional("smartFolder"), subType: Optional("smartFolderFaces") collection list count: 1
 
 type: Optional("smartFolder"), subType: Optional("any") collection list count: 2 
 */

/*
    .smartAlbum .smartAlbumUserLibrary --> Camera Roll
 */

class FetchingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // MARK: Properties
    var assetCollections = [PHAssetCollection]()
    
    let assetCollectionTypes = [PHAssetCollectionType.album, .smartAlbum, .moment]
    
    let assetCollectionTypesMap = [
        PHAssetCollectionType.album: "album",
        .smartAlbum: "smartAlbum",
        .moment: "moment"
    ]
    
    let assetCollectionSubTypes = [PHAssetCollectionSubtype.albumRegular, .albumSyncedEvent, .albumSyncedFaces, .albumSyncedAlbum, .albumImported, .albumMyPhotoStream, .albumCloudShared, .smartAlbumGeneric, .smartAlbumPanoramas, .smartAlbumVideos, .smartAlbumFavorites, .smartAlbumTimelapses, .smartAlbumAllHidden, .smartAlbumRecentlyAdded, .smartAlbumBursts, .smartAlbumSlomoVideos, .smartAlbumUserLibrary, /*.smartAlbumSelfPortraits,*/ /*.smartAlbumScreenshots,*/ .any]
    
    let assetCollectionSubTypesMap = [
        PHAssetCollectionSubtype.albumRegular: "albumRegular",
        .albumSyncedEvent: "albumSyncedEvent",
        .albumSyncedFaces: "albumSyncedFaces",
        .albumSyncedAlbum: "albumSyncedAlbum",
        .albumImported: "albumImported",
        .albumMyPhotoStream: "albumMyPhotoStream",
        .albumCloudShared: "albumCloudShared",
        .smartAlbumGeneric: "smartAlbumGeneric",
        .smartAlbumPanoramas: "smartAlbumPanoramas",
        .smartAlbumVideos: "smartAlbumVideos",
        .smartAlbumFavorites: "smartAlbumFavorites",
        .smartAlbumTimelapses: "smartAlbumTimelapses",
        .smartAlbumAllHidden: "smartAlbumAllHidden",
        .smartAlbumRecentlyAdded: "smartAlbumRecentlyAdded",
        .smartAlbumBursts: "smartAlbumBursts",
        .smartAlbumSlomoVideos: "smartAlbumSlomoVideos",
        .smartAlbumUserLibrary: "smartAlbumUserLibrary",
        /*.smartAlbumSelfPortraits: "smartAlbumSelfPortraits",*/
        /*.smartAlbumScreenshots: "smartAlbumScreenshots",*/
        .any: "any"
    ]
    
    let types = [PHCollectionListType.momentList, .folder, .smartFolder]
    
    let subTypes = [PHCollectionListSubtype.momentListCluster, .momentListYear, .regularFolder, .smartFolderEvents, .smartFolderFaces, .any]
    
    let typeMap = [
        PHCollectionListType.momentList: "momentList",
        .folder: "folder",
        .smartFolder: "smartFolder"
    ]
    
    let subTypeMap = [
        PHCollectionListSubtype.momentListCluster: "momentListCluster",
        .momentListYear: "momentListYear",
        .regularFolder: "regularFolder",
        .smartFolderEvents: "smartFolderEvents",
        .smartFolderFaces: "smartFolderFaces",
        .any: "any"
    ]
    
    var fetchResult: PHFetchResult<PHAsset>!
    
    lazy var cellIdentifier = String(describing: GridViewCell.self)
    
    fileprivate let imageManager = PHCachingImageManager()
    fileprivate var thumbnailSize: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Requests the user’s permission, if needed, for accessing the Photos library.
        let fetchAssets = {[unowned self] in
            let allPhotosOptions = PHFetchOptions()
            allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
            self.fetchResult = PHAsset.fetchAssets(with: allPhotosOptions)
        }
        
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            PHPhotoLibrary.requestAuthorization({ (authorizedStatus) in
                if authorizedStatus == .authorized {
                    fetchAssets()
                }
                else {
                    print("App doesn't have permission to access Photo Library with authorized status: \(authorizedStatus.rawValue)")
                }
            })
        }
        else {
            fetchAssets()
        }
        
        collectionView?.register(GridViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.backgroundColor = .white
        
        PHPhotoLibrary.shared().register(self)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Determine the size of the thumbnails to request from the PHCachingImageManager
        let scale = UIScreen.main.scale
        let cellSize = (collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        thumbnailSize = CGSize(width: cellSize.width * scale, height: cellSize.height * scale)
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let asset = fetchResult.object(at: indexPath.item)
        
        // Dequeue a GridViewCell.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GridViewCell.self), for: indexPath) as? GridViewCell
            else { fatalError("unexpected cell in collection view") }
        
        if #available(iOS 9.1, *) {
            #if os(iOS)
                // Add a badge to the cell if the PHAsset represents a Live Photo.
                if asset.mediaSubtypes.contains(.photoLive) {
                    cell.livePhotoBadgeImage = PHLivePhotoView.livePhotoBadgeImage(options: .overContent)
                }
            #endif
        }
        
        // Request an image for the asset from the PHCachingImageManager.
        cell.representedAssetIdentifier = asset.localIdentifier
        imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
            // The cell may have been recycled by the time this handler gets called;
            // set the cell's thumbnail image only if it's still showing the same asset.
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.thumbnailImage = image
            }
        })
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let assetVC = AssetViewController()
        assetVC.asset = fetchResult.object(at: indexPath.item)
        
        navigationController?.pushViewController(assetVC, animated: true)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    // MARK: Private Methods
    func printCollectionListAssembleType(_: Void) -> Void {
        for t in assetCollectionTypes {
            for subT in assetCollectionSubTypes {
                let assetCollections = PHAssetCollection.fetchAssetCollections(with: t, subtype: subT, options: nil)
                print("type: \(assetCollectionTypesMap[t]), subType: \(assetCollectionSubTypesMap[subT]) collection list count: \(assetCollections.count) \n")
                
            }
        }
        
        print("\n============================================================\n")
        
        for type in types {
            for subType in subTypes {
                let collectionList = PHCollectionList.fetchCollectionLists(with: type, subtype: subType, options: nil)
                
                print("type: \(typeMap[type]), subType: \(subTypeMap[subType]) collection list count: \(collectionList.count) \n")
            }
        }
    }

}

extension FetchingViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let collectionView = self.collectionView else { return }
        
        guard let changes = changeInstance.changeDetails(for: fetchResult)
            else { return }
        
        // Change notifications may be made on a background queue.
        // Re-dispatch to the main queue to update the UI.
        DispatchQueue.main.sync {
            // Hang on to the new fetch result.
            fetchResult = changes.fetchResultAfterChanges
            if changes.hasIncrementalChanges {
                // If we have incremental diffs, animate them in the collection view.
                guard let collectionView = self.collectionView else { fatalError() }
                collectionView.performBatchUpdates({
                    // For indexes to make sense, updates must be in this order:
                    // delete, insert, reload, move
                    if let removed = changes.removedIndexes, removed.count > 0 {
                        collectionView.deleteItems(at: removed.map({ IndexPath(item: $0, section: 0) }))
                    }
                    if let inserted = changes.insertedIndexes, inserted.count > 0 {
                        collectionView.insertItems(at: inserted.map({ IndexPath(item: $0, section: 0) }))
                    }
                    if let changed = changes.changedIndexes, changed.count > 0 {
                        collectionView.reloadItems(at: changed.map({ IndexPath(item: $0, section: 0) }))
                    }
                    changes.enumerateMoves { fromIndex, toIndex in
                        collectionView.moveItem(at: IndexPath(item: fromIndex, section: 0),
                                                to: IndexPath(item: toIndex, section: 0))
                    }
                })
            } else {
                // Reload the collection view if incremental diffs are not available.
                collectionView.reloadData()
            }
        }
    }
}
