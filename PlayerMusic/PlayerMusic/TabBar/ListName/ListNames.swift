//
//  ListNames.swift
//  PlayerMusic
//
//  Created by Gerardo Castillo Durán on 06/02/21.
//

import SwiftUI

struct ListNames: View {
    
    // Core Data
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Song.entity(), sortDescriptors: []) var songs: FetchedResults<Song>
    
    var body: some View {
        VStack{
            
            Button(action: {
                let firtName = ["Name 1","Name2", "Name3","Name4","Name5"]
                let lastName = ["LastName1","LastName2", "LastName3","LastName4","LastName5"]

                let chosenName = firtName.randomElement()!
                let chosenLastName = lastName.randomElement()!

                let song = Song(context: self.moc)
                song.id = UUID()
                song.name = "\(chosenName) \(chosenLastName)"

                
                do {
                    try self.moc.save()
                } catch {
                    
                    print(error)
                    
                }

             }, label: {
                 Text("Add USer")
                     .foregroundColor(Color.purple)
             }).padding(.bottom,10).padding(.top,10)
            List{
                
                ForEach(songs, id: \.id){song in
                    Text( song.name ?? "random_name").foregroundColor(Color.white)
                }

            }.padding(.bottom,20)

        }
    }
}

struct ListNames_Previews: PreviewProvider {
    static var previews: some View {
        ListNames()
    }
}
