//
//  HomeView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/3/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            
            VStack(){
                Rectangle().frame(height: 120).foregroundColor(.white)
                Text("Vive Tunisie")
                    .font(.custom("Optima", size: 40))
                    .bold()
   
                    Text("Signalement des dysfonctionnements en espaces publiques").bold()
                        .font(.custom("Optima", size: 20))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .foregroundColor(.black)
                        .padding()

                VStack(spacing: 10){
                    Text("Pour suivre vos signalements, vous devez :")
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
                    
                    VStack(spacing:20){
                    NavigationLink(destination: Text("New Sign")){
                        HStack(spacing:25){
                            Image("NewSignal")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            
                            Text("Nouveau Signalement")
                                .font(.custom("Futura", size: 18))
                                .foregroundColor(.black)
                            
                            }.frame(width: 300, height: 60)
                            .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2, x: 1, y: 2)
                    } // new signal
                    
                    NavigationLink(destination: Text("Account")){
                    HStack(spacing:25){
                        Image("Person")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        
                        Text("Gérer mon profile      ")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(.black)
                        
                        }.frame(width: 300, height: 60)
                        .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2, x: 1, y: 2)
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
                        .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2, x: 1, y: 2)
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
                            .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2, x: 1, y: 2)
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
                        .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2, x: 1, y: 2)
                        }
                        
                    }// Actions Buttons
                    Spacer()
                    ZStack(){
                    Rectangle().frame(height: 60).foregroundColor(Color(red: 224/255, green: 144/255, blue: 144/255))
                    }
                }
            }.edgesIgnoringSafeArea(.all)// THE Vstack
        }// Nav View
    }// Body
}// Screen

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
