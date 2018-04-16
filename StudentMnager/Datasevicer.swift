//
//  File.swift
//  StudentMnager
//
//  Created by Huy on 4/10/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit
import CoreData
class Datasevicer {
    static let shared: Datasevicer = Datasevicer()
    private var _array: [Entity]?
    var indexPath: IndexPath?
    var array: [Entity] {
        set{
            _array = newValue
        }
        get{
            if _array == nil {
                updateData()
            }
            return _array ?? []
        }
    }
    func updateData(){
        _array = try? AppDelegate.context.fetch(Entity.fetchRequest())
    }
    
    private var _fetchedResultsController: NSFetchedResultsController<Entity>? = nil
    var fetchedResultsController: NSFetchedResultsController<Entity> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        let fetRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetRequest.sortDescriptors = [sort]
        
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetRequest, managedObjectContext: AppDelegate.context, sectionNameKeyPath: nil, cacheName: "cache")
//        _fetchedResultsController?.delegate = self
        try? _fetchedResultsController?.performFetch()
        return _fetchedResultsController!
    }
    
    func deleteData(index: IndexPath){
      //  _fetchedResultsController.ob
    }
}
