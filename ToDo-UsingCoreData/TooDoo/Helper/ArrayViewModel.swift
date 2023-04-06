//
//  ArrayViewModel.swift
//  TooDoo
//
//  Created by Md. Faysal Ahmed on 18/12/22.
//

import Foundation
import UIKit

class ArrayViewModel {
    
    var arr = [DataArrayForCoreData]()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    func fetchData() {        
        do {
            arr = try self.context.fetch(DataArrayForCoreData.fetchRequest())
        }
        catch { print("Error:-- ", error.localizedDescription)}
    }
    
    
    func saveData(title: String?, detail: String?) {
        
        let array = DataArrayForCoreData(context: context)
        array.title = title
        array.detail = detail
        
        do {
            try self.context.save()
        }
        catch { print("Error:--- ", error.localizedDescription)}
    }
    
    
    // It's created by me Faysal
    func saveUpdate() {
        do {
            try self.context.save()
        }
        catch { print("Error:--- ", error.localizedDescription)}
    }

    
    
    func deleteData(index: Int) {
        context.delete(arr[index])
        
        do {
            try context.save()
        }
        catch { print("Error:---- ", error.localizedDescription)}
    }
    
    
}
