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
    static func saveSearchedData(name: String) {
        let currentData = getSearchedData()
        if currentData.count > 0 {
            if (currentData.filter {$0 == name}.count > 0) {
                return
            }
        }
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = delegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "SearchedEntity", in: managedContext)!
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
    static func getSearchedData() -> [String] {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = delegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchedEntity")
        request.returnsObjectsAsFaults = false
        do {
            guard let result = try managedContext.fetch(request) as? [NSManagedObject] else { return []}
            let resultString = result.map { return $0.value(forKey: "name") as! String }
        return resultString
        } catch {
        print("Failed")
           return  []
        }
    }
}
