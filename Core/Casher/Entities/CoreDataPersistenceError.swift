//
//  CoreDataPersistenceError.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
