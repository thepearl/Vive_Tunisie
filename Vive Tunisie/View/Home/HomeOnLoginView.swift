//
//  HomeView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/3/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Firebase

struct HomeOnLoginView: View {
    @EnvironmentObject var session: SessionStore
    @State private var showWelcomeAlert = true
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let user = Auth.auth().currentUser

    
    var body: some View {
        ZStack{
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
                        
                        NavigationLink(destination: Profile()){
                        HStack(spacing:25){
                            Image("Person")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            
                            Text("Gérer mon profile      ")
                                .font(.custom("Futura", size: 18))
                                .foregroundColor(.black)
                            
                            }.frame(width: 300, height: 60)
                            .background(Color.offWhite)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        }
                        
                        NavigationLink(destination: Text("Guide")){
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
                        
                        SignoutView()
                        
                        Spacer()
                    }
            }
                .background(Color.offWhite).edgesIgnoringSafeArea(.bottom)// THE Vstack
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        // Nav View
        }
        .popup(isPresented: self.$showWelcomeAlert, type: .default, autohideIn: 1.75) {
                   VStack(spacing: 10) {
                       Image("Welcome")
                           .resizable()
                           .aspectRatio(contentMode: ContentMode.fit)
                           .frame(width: 125, height: 125)

                    Text("Bienvenue")
                           .foregroundColor(.black)
                           .fontWeight(.bold)

                       Text("Vous pouvez maintenant suivre vos signalements.")
                        .font(.custom("Futura", size: 18))
                           .foregroundColor(.black)
                           .multilineTextAlignment(.center)
                           .lineLimit(2)
                   }
                   .padding(EdgeInsets(top: 40, leading: 20, bottom: 40, trailing: 20))
                   .frame(width: 300, height: 400)
                   .background(Color(.white))
                   .cornerRadius(10.0)
                   .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
               }
    }// Body
}// Screen


struct HomeOnLoginView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
         .environmentObject(SessionStore())
    }
}
