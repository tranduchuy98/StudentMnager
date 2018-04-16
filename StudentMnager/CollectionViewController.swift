//
//  CollectionViewController.swift
//  StudentMnager
//
//  Created by Huy on 4/10/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit
import CoreData

class CollectionViewController: UICollectionViewController , NSFetchedResultsControllerDelegate {
 
    var fetchedResultsController = Datasevicer.shared.fetchedResultsController
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultsController.delegate = self

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Datasevicer.shared.indexPath = nil
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = fetchedResultsController.sections![section]
        return count.numberOfObjects
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let data = fetchedResultsController.object(at: indexPath)
        cell.image.image = data.image as? UIImage
        cell.labelTxt.text = data.name
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Datasevicer.shared.indexPath = indexPath
       //   collectionView.deleteItems(at: [indexPath])
       // AppDelegate.saveContext()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            collectionView?.insertItems(at: [newIndexPath!])
        case .update:
            collectionView?.reloadItems(at: [indexPath!])
        case . delete:
            collectionView?.deleteItems(at: [indexPath!])
        default:
            break
        }
    }
   
    
    @IBAction func editBtn(_ sender: UIBarButtonItem) {
        
    }
  
  
    open func deleteItems(at indexPaths: [IndexPath]){}
    


}




















