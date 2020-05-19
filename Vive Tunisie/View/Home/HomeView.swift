//
//  HomeView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/3/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Firebase
struct HomeView: View {
    @EnvironmentObject var session: SessionStore

    
    func getUser () {
         session.listen()
     }
    
    var body: some View {
        NavigationView{
            VStack(){
                HStack{
                    Spacer()
                }
                    Text("Signalement des dysfonctionnements en espaces publiques").bold()
                        .font(.custom("Optima", size: 16))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .foregroundColor(.black)
                        .padding()
             if (session.session == nil) {
                VStack(spacing: 10){
                    Text("Pour suivre vos signalements, vous devez ")
                    .font(.custom("Optima", size: 20))
                                           .multilineTextAlignment(.leading)
                                           .lineLimit(2)
                                           .foregroundColor(.black)
                    NavigationLink(destination: LoginView()){
                        Text("Vous identifier").bold()
                            .font(.custom("Optima", size: 15))
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(Color(red: 224/255, green: 144/255, blue: 144/255))
                            .cornerRadius(10)
                    }.padding(.bottom, 10)
                }
                  }
                    VStack(spacing: 10){
                        VStack(spacing:20){
                            NavigationLink(destination: NewSignalView()){
                            HStack(spacing:25){
                                Image("NewSignal")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                
                                Text("Nouveau Signalement")
                                    .font(.custom("Futura", size: 18))
                                    .foregroundColor(.black)
                                
                                }.frame(width: 300, height: 60)
                                .background(Color.offWhite)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        } // new signal
                        
                        NavigationLink(destination: UserGuideView()){
                        HStack(spacing:25){
                            Image("Guide")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            
                            Text("Guide d'utilisation     ")
                                .font(.custom("Futura", size: 18))
                                .foregroundColor(.black)
                            
                            }.frame(width: 300, height: 60)
                            .background(Color.offWhite)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        }
                        
                            NavigationLink(destination: Text("Call")){
                            HStack(spacing:25){
                                Image("Phone")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                
                                Text("Nous contacter         ")
                                    .font(.custom("Futura", size: 18))
                                    .foregroundColor(.black)
                                
                                }.frame(width: 300, height: 60)
                                .background(Color.offWhite)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                            }
                            
                        NavigationLink(destination: Text("About us")){
                        HStack(spacing:25){
                            Image("AboutUs")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            
                            Text("A propos de nous     ")
                                .font(.custom("Futura", size: 18))
                                .foregroundColor(.black)
                            
                            }.frame(width: 300, height: 60)
                            .background(Color.offWhite)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                            }
                            
                        }// Actions Buttons
                        Spacer()

                    }
                  
                
                
            }
                .background(Color.offWhite).edgesIgnoringSafeArea(.bottom)// THE Vstack
                .navigationBarTitle("Vive Tunisie", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }// Nav View
        .onAppear(perform: getUser)
    }// Body
}// Screen

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
         .environmentObject(SessionStore())
    }
}
