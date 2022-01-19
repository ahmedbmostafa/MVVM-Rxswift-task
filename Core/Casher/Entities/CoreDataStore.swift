//
//  CoreDataStore.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import UIKit
import CoreData

class CoreDataStore {
    static var managedObjectContext: NSManagedObjectContext? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer.viewContext
        }
        return nil
    }
}
