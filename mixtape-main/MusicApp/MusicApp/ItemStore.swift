//
//  ItemStore.swift
//  MusicApp
//
//  Created by 小华 on 11/13/22.
//

import UIKit

class ItemStore {


    var allItems = [Item]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("new.plist")
       }()

   // let itemArchiveURL: URL = "/Users/hhan/Desktop"
        
    @discardableResult func createItem() -> Item {
        
        let newItem = Item()  //why random???
        allItems.append(newItem)
        return newItem
    }
    
   @objc func saveChanges() -> Bool {
        print("Saving items to :\(itemArchiveURL)")
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allItems)
            try data.write(to: itemArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError {
            print("Error encoding allItems: \(encodingError)")
            return false
        }
    }
    
    init() {
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let unarchiver = PropertyListDecoder()
            let items = try unarchiver.decode([Item].self, from: data)
            allItems = items
        } catch {
            print("Eroor reading in saved items: \(error)")
        }
       // let notificationCenter = NotificationCenter.default
      //  notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
}
