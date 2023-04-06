//
//  DataArrayForCoreData+CoreDataProperties.swift
//  TooDoo
//
//  Created by Md. Faysal Ahmed on 18/12/22.
//
//

import Foundation
import CoreData


//Created by nsManageObject subclass
extension DataArrayForCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataArrayForCoreData> {
        return NSFetchRequest<DataArrayForCoreData>(entityName: "DataArrayForCoreData")
    }

    @NSManaged public var detail: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension DataArrayForCoreData : Identifiable {

}
