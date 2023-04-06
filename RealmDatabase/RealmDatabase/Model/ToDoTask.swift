//
//  RealmModel.swift
//  RealmDatabase
//
//  Created by Md. Faysal Ahmed on 7/1/23.
//

import RealmSwift

//It inherits the 'Object' class which is a class that comes with Realm
class ToDoTask: Object {
    
    @objc dynamic var tasknote: String?
    @objc dynamic var taskid: String?
}

//@objc means Swift code is visible to Objective C and dynamic means I want to use 'Objective C dynamic dispatch'.
