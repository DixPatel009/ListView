//
//  CoreDataManager.swift
//  ListView
//
//  Created by Dixit Mac New on 06/06/24.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ListView")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            } else {
                print("Successfully Loaded Core Data :)")
            }
        }
    }
    
    //get all item from coredata
    func getItemList() -> [LocalListModel] {
        let fetchRequest: NSFetchRequest<ListItem> = ListItem.fetchRequest()
        do {
            
            let listArray = try persistentContainer.viewContext.fetch(fetchRequest)
            
            var localArray = [LocalListModel]()
            
            for itemObject in listArray {
                localArray.append(LocalListModel(title: itemObject.title, subDescription: itemObject.subdescription, date: itemObject.date, image: itemObject.image))
            }
            
            //Short data based on date and return new data set
            return localArray.sorted(by: { $0.date?.compare($1.date ?? Date()) == .orderedDescending })
        } catch {
            return []
        }
    }
    
    //save item in core data
    func saveItem(title: String?, subDescription: String?, date: Date?, image: String?) {
        let item = ListItem(context: persistentContainer.viewContext)
        item.title = title
        item.subdescription = subDescription
        item.date = date
        item.image = image
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save favorite \(error)")
        }
    }
    
}
