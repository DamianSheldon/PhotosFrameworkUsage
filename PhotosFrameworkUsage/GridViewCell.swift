//
//  GridViewCell.swift
//  PhotosFrameworkUsage
//
//  Created by DongMeiliang on 22/12/2016.
//  Copyright © 2016 Meiliang Dong. All rights reserved.
//

import UIKit

class GridViewCell: UICollectionViewCell {
    var imageView: UIImageView
    var livePhotoBadgeImageView: UIImageView
    
    var representedAssetIdentifier: String?
    
    var thumbnailImage: UIImage? {
        didSet {
            imageView.image = thumbnailImage
        }
    }
    var livePhotoBadgeImage: UIImage? {
        didSet {
            livePhotoBadgeImageView.image = livePhotoBadgeImage
        }
    }
    
    override init(frame: CGRect) {
        imageView = UIImageView(frame: .zero)
        
        livePhotoBadgeImageView = UIImageView(frame: .zero)

        super.init(frame: frame)
        
        setUpViewHierarchy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        imageView = aDecoder.decodeObject(forKey: "imageView") as! UIImageView
        
        livePhotoBadgeImageView = aDecoder.decodeObject(forKey: "livePhotoBadgeImageView") as! UIImageView
        
        super.init(coder: aDecoder)
        
        setUpViewHierarchy()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        livePhotoBadgeImageView.image = nil
    }
    
    // MARK: Private Methods
    func setUpViewHierarchy() -> Void {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        livePhotoBadgeImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(livePhotoBadgeImageView)
        
        contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: contentView, attribute: .right, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        contentView.addConstraint(NSLayoutConstraint(item: livePhotoBadgeImageView, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: livePhotoBadgeImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28))
        contentView.addConstraint(NSLayoutConstraint(item: livePhotoBadgeImageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: livePhotoBadgeImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28))
    }
}
