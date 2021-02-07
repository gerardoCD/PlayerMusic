//
//  PlayerMusicApp.swift
//  PlayerMusic
//
//  Created by Gerardo Castillo Durán on 05/02/21.
//

import SwiftUI
import CoreData

@main
struct CustomTabBarApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    let persistenController = PersitenceController.shared
    
    var body: some Scene {
        WindowGroup {
            
            ContentView(viewRouter: viewRouter).environment(\.managedObjectContext, persistenController.container.viewContext)
        }
    }
}
