//
//  Todo+CoreDataProperties.swift
//  TOKEN
//
//  Created by Md. Faysal Ahmed on 30/11/22.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

}

extension Todo : Identifiable {

}
