//
//  SignUpCard.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/6/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Firebase

struct SignUpCard: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var name = ""
    @State private var gov = ""

    var body: some View {

             VStack(spacing: 15){
                 HStack{
                 Image("Person")
                     .resizable()
                     .frame(width: 20, height: 20)
                     .padding(.horizontal, 20)
                     
                 TextField("Nom et Prenom", text: $name)
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
                .frame(width: 20, height: 20)
                .padding(.horizontal, 20)
                
            TextField("Governaurat", text: $gov)
                .foregroundColor(Color("Text"))
                .keyboardType(.emailAddress)

                } // GOV
                .frame(width: 350, height: 50)
                .background(Color.white)
                .cornerRadius(15)
              
         
                .frame(width: 350, height: 50)
                .background(Color.white)
                .cornerRadius(15)
                
                VStack(){
                 Button(action: {
                  
                    self.CreateUser(name: self.name,pass : self.pass,email: self.email,gov : self.gov) { (status) in
                                               
                                               if status{
                                                   
                                                   print("done")
                                               }
                                               else{
                                                print("Fuck")
                                                    }
                    }
                 
                 }){
                     Text("S'inscrire")
                         .font(.custom("futura", size: 15))
                         .foregroundColor(.white)
                         .padding(.horizontal, 80)
                         .frame(width: 300, height: 50)
                         .background(Color("Button"))
                     .cornerRadius(10)
                     
                 } //Button S'inscrire

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
    

func CreateUser(name: String,pass : String,email: String,gov : String,completion : @escaping (Bool)-> Void){
    
    let db = Firestore.firestore()
    
    Auth.auth().createUser(withEmail: email, password: pass){ authResult, error in
        if(error != nil){
            let uid = Auth.auth().currentUser?.uid
        db.collection("users").document(uid!).setData(["name":name,"pass":pass,"email":email,"uid":uid!]) { (err) in
                               
                               if err != nil{
                                   
                                   print((err?.localizedDescription)!)
                                   return
                               }
                               
                               completion(true)
                               
                               UserDefaults.standard.set(true, forKey: "status")
                               
                               UserDefaults.standard.set(name, forKey: "UserName")
                               
                               NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                           }
            
        }
 
    }
        }
    }



struct SignUpCard_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCard()
    }
}





