//
//  User.swift
//  PlayerMusic
//
//  Created by Gerardo Castillo Durán on 05/02/21.
//

import SwiftUI

struct User : View {
    
    @State var index = 0
    @State var bio = false
    
    var body: some View{
        
        VStack{
            
            HStack(spacing: 15){


                Text("Profile")
                    .font(.title)

                Spacer(minLength: 0)

                Button(action: {
                    self.bio.toggle()
                }) {

                    Text("Biography")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color("Color"))
                        .cornerRadius(10)
                }
            }
            .padding()
            

            
            HStack{
                
                VStack(spacing: 0){
                    
                    Rectangle()
                    .fill(Color("Color"))
                    .frame(width: 80, height: 3)
                    .zIndex(1)
                    
                    
                    Image("profile")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 6)
                    .padding(.bottom, 4)
                    .padding(.horizontal, 8)
//                    .background(Color("Color1"))
                    .cornerRadius(10)
//                    .shadow(color: Color.black.opacity(0.1), radius: 5, x:
                }
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Text("Rebeca Perez")
                        .font(.title)
                        .foregroundColor(Color.white.opacity(0.8))
                    
                    Text("User: Pixa4312")
                        .foregroundColor(Color.white.opacity(0.7))
                        .padding(.top, 8)
                    
                    Text("correo@gmail.com")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                .padding(.leading, 20)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            
            if (bio){
                
                VStack(){
//                    Spacer(minLength: 3)
                    
                    Text("Soy una persona que le gusta estar todo el día aprendíendo cosas nuevas").fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
                }.padding(.horizontal,29).padding(.vertical,10)

            }
            

            
            HStack(spacing: 20){
                
                VStack(spacing: 12){
                    
                    Image("twitter")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    
                    Text("Twitter")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("Music")
                        .foregroundColor(Color("Color"))
                    
                    Text("3 canciones")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                .background(Color("Color1"))
                .cornerRadius(15)

                VStack(spacing: 12){
                    
                    Image("apple_logo")
                        .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    
                    Text("Apple")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("Music")
                        .foregroundColor(Color("Color"))
                    
                    Text("6 canciones")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
            
                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                .background(Color("Color1"))
                .cornerRadius(15)

            }
            .padding(.top,20)
            
            Spacer(minLength: 0)
        }
    }
}

