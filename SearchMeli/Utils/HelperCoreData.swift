//
//  HelperCoreData.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import CoreData
import UIKit


class HelperCoreData {
    
    static func saveSearchedData(name:String){
        let currentData = getSearchedData()
        if(currentData.count > 0){
            if (currentData.filter{$0 == name}.count > 0){
                return
            }
        }
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "SearchedEntity", in : managedContext)!
        let record = NSManagedObject(entity: entity, insertInto: managedContext)
        record.setValue(name, forKey: "name")
        do {
            try managedContext.save()
            print("Record Added!")
        } catch
            let error as NSError {
            print("Could not save. \(error),\(error.userInfo)")
        }
    }
    
    static func getSearchedData() -> [String]{
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchedEntity")
        request.returnsObjectsAsFaults = false
        do {
        let result = try managedContext.fetch(request) as! [NSManagedObject]
            let resultString = result.map{ return $0.value(forKey: "name") as! String }
//        for data in result as! [NSManagedObject] {
//        print(data.value(forKey: "name") as! String)
//        }
        print(resultString)
        return resultString
        } catch {
        print("Failed")
           return  []
        }
    }
}
