//
//  Test+CDProperties.swift
//  MVVM + Rxswift task
//
//  Created by ahmed mostafa on 18/01/2022.
//

import Foundation
import CoreData


extension LocalStacklist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocalStacklist> {
        return NSFetchRequest<LocalStacklist>(entityName: "LocalStacklist")
    }

    @NSManaged public var title: String?
    @NSManaged public var link: String?

}

extension LocalStacklist : Identifiable {

}
