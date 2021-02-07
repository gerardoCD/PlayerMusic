//
//  Persistense.swift
//  PlayerMusic
//
//  Created by Gerardo Castillo Durán on 06/02/21.
//

import Foundation
import CoreData

struct PersitenceController{
    static let shared = PersitenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name:"music")
        
        container.loadPersistentStores { (store, error) in
            if let error = error as NSError? {
                fatalError("Fatal error: \(error)")
            }
            
            
        }
    }
}
