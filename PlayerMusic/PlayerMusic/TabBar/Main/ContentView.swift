//
//  ContentView.swift
//  PlayerMusic
//
//  Created by Gerardo Castillo Durán on 05/02/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    @State var showPopUp = false
    
    // Core Data
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Song.entity(), sortDescriptors: []) var songs: FetchedResults<Song>
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    ListImages(height: Double(geometry.size.height), width:  Double(geometry.size.width))

                case .liked:
                    VStack{
                        
                        Button(action: {
                            let firtName = ["Name 1","Name2", "Name3","Name4","Name5"]
                            let lastName = ["LastName1","LastName2", "LastName3","LastName4","LastName5"]

                            let chosenName = firtName.randomElement()!
                            let chosenLastName = lastName.randomElement()!

                            let song = Song(context: self.moc)
                            song.id = UUID()
                            song.name = "\(chosenName) \(chosenLastName)"

            //                try? self.moc.save()
                            
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
            //                ForEach(0...100, id: \.self){song in
            //                    Text( "random_name").foregroundColor(Color.white)
            //                }
                            
                            ForEach(songs, id: \.id){song in
                                Text( song.name ?? "random_name").foregroundColor(Color.white)
                            }

                        }.padding(.bottom,20)

                    }
                case .records:
                    MusicPlayer()
                case .user:
                    User()
                }
                Spacer()
                ZStack {
                    if showPopUp {
                        PlusMenu(widthAndHeight: geometry.size.width/7)
                            .offset(y: -geometry.size.height/6)
                    }
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.square.fill", tabName: "Gallery")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "music.note.list", tabName: "Biblioteca")
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                .foregroundColor(Color("DarkPurple"))
                                .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                        }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                withAnimation {
                                    showPopUp.toggle()
                                }
                            }
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .records, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Music")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Account")
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground").shadow(radius: 2))
                }
            }
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
            .preferredColorScheme(.light)
    }
}

struct PlusMenu: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }
            .transition(.scale)
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
            .foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
    }
}


struct FittedImage: View
{
    let imageName: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
        }
        .frame(width: width, height: height)
    }
}
