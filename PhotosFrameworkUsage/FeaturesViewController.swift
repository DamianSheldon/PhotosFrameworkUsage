//
//  FeaturesViewController.swift
//  PhotosFrameworkUsage
//
//  Created by DongMeiliang on 21/12/2016.
//  Copyright © 2016 Meiliang Dong. All rights reserved.
//

import UIKit

class FeaturesViewController: UITableViewController {
    
    // MARK: Properties
    lazy var features: [String: UIViewController] = [
        "Fetching objects": FetchingViewController(collectionViewLayout:UICollectionViewFlowLayout()),
    ]
    
    var entries = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Features"
        
        /*
            Array: init<S : Sequence where S.Iterator.Element == Element>(_ s: S)
            
            Dictionary: var keys: LazyMapCollection<Dictionary<Key, Value>, Key> { get }
         */
        entries += Array(features.keys)
    }

    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath)
        
        cell.textLabel?.text = entries[indexPath.row]
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entries[indexPath.row]
        if let vc = features[entry] {
            vc.title = entry
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

