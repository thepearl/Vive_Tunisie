//
//  SignUpCard.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/6/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
struct SignUpCard: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var noms = ""
    @State private var gov = ""

    var body: some View {
      
         VStack(spacing: 5){
             HStack{
             Image("Person")
                 .resizable()
                 .frame(width: 20, height: 20)
                 .padding(.horizontal, 20)
                 
             TextField("Nom et Prenom", text: $noms)
                 .foregroundColor(Color("Text"))
                 .keyboardType(.emailAddress)

                 } // Nom et prenom
                 .frame(width: 350, height: 50)
                 .background(Color.white)
                 .cornerRadius(15)
            
            HStack{
             Image("Email")
                 .resizable()
                 .frame(width: 20, height: 20)
                 .padding(.horizontal, 20)
                 
             TextField("Courrier électronique", text: $email)
                 .foregroundColor(Color("Text"))
                 .keyboardType(.emailAddress)

                 } // Email
                 .frame(width: 350, height: 50)
                 .background(Color.white)
                 .cornerRadius(15)
             
            HStack{
                    Image("Pass")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 20)
                
                    SecureField("Mot de passe", text: $pass)
                            .foregroundColor(Color("Text"))
                    } // SecureField : Mot de passe
                                .frame(width: 350, height: 50)
                                .background(Color.white)
                                .cornerRadius(15)
           
            HStack{
            Image("Gov")
                .resizable()
                .frame(width: 15, height: 20)
                .padding(.horizontal, 20)
                
            TextField("Gouvernorat", text: $noms)
                .foregroundColor(Color("Text"))
                .keyboardType(.emailAddress)

                } // Gov
                .frame(width: 350, height: 50)
                .background(Color.white)
                .cornerRadius(15)
                
            
                   
            
             Button(action: {
                 // TODO
             }){
                 Text("S'inscrire")
                     .font(.custom("futura", size: 15))
                     .foregroundColor(.white)
                     .padding(.horizontal, 80)
                     .frame(width: 300, height: 50)
                     .background(Color("Button"))
                 .cornerRadius(10)
                 
             } //Button S'inscrire

             HStack(spacing: 20){
                 Image("Line")
                 Text("Ou")
                     .font(.custom("futura", size: 14))
                     .foregroundColor(Color("Blur"))
                 Image("Line")
             } // Divider "Ou"
             
             HStack(spacing:20){
                 Button(action: {
                  //TODO
                 }){
                     HStack{ Image("Google")
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 25, height: 25)
                     Text("Google")
                     .font(.custom("Futura", size: 15))
                     .foregroundColor(Color("Text"))
                     }.frame(width: 130, height: 35)
                     .padding(.all, 5)
                 
                 } // Google
                     .background(Color.white)
                     .cornerRadius(5)
                     
                 
                 Button(action: {
                  //TODO
                 }){
                     HStack{
                     Image("Facebook")
                     .resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 25, height: 25)
                     Text("Facebook")
                         .font(.custom("Futura", size: 15))
                         .foregroundColor(Color("Text"))
                     }.frame(width: 130, height: 35)
                     .padding(.all, 5)
                 
                 } // Facebook
                     .background(Color.white)
                     .cornerRadius(10)
                     
             } // Connect via ..
                 
             Spacer()
             
             Button(action: {
                 //TODO
             }){
                 VStack(spacing: 0){
                 Text("Conditions Générales d’Utilisation")
                     .foregroundColor(Color("Blur"))
                     .font(.custom("futura", size: 12))
                     Image("Line")
                     .foregroundColor(Color("Blur"))
                 }
             }   // Conditions Generale
         }
        }

}
struct SignUpCard_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCard()
    }
}
