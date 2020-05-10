//
//  LoginCard.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/6/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase
import GoogleSignIn

struct LoginCard: View {

    
    @State private var email = ""
    @State private var pass = ""
    @State private var msg = ""
    @State private var isActive = false
    @State private var showingAlert = false
    @State var isLoading = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        VStack(spacing: 10){
            HStack{
            Image("Email")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.horizontal, 20)
                
            TextField("Courrier électronique", text: $email)
                .foregroundColor(Color(.black))
                .keyboardType(.emailAddress)

                } // Email
                .frame(width: 350, height: 50)
                .background(Color.white)
                .cornerRadius(15)
            
            VStack(spacing:5){
                HStack{
            Image("Pass")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.horizontal, 20)
                
                SecureField("Mot de passe", text: $pass)
                    .foregroundColor(Color(.black))
                } // SecureField
                .frame(width: 350, height: 50)
                .background(Color.white)
                .cornerRadius(15)
                
               
                    Button(action: {
                        //TODO
                    }){
                            Text("Mot de passe oublié ?")
                                .foregroundColor(Color("Hint"))
                                .font(.custom("futura", size: 15))
                    } // Mot de passe oublie
              
                //Loading View
                
                if isLoading{
                    
                               LoadingView()
                           }
                
            } // Mot de passe
           
           NavigationLink(destination: HomeView(), isActive: self.$isActive){
                          Button(action: {
                            self.isLoading = true
                              Auth.auth().signIn(withEmail: self.email, password: self.pass){ (authResult, error) in
                                  if error != nil {
                                    
                                      print(error!)
                                        self.showingAlert = true
                                       self.isLoading = false
                                  }
                                    
                                  else{
                                      print(authResult!)
                                      self.isActive = true
                                   // self.isLoading = false
                                                                      }
                              }
                            
                            
                          }){
                              Text("Se Connecter")
                                  .font(.custom("futura", size: 15))
                                  .foregroundColor(.white)
                                  .padding(.horizontal, 80)
                                  .frame(width: 300, height: 50)
                                  .background(Color(red: 224/255, green: 144/255, blue: 144/255))
                                .cornerRadius(10)
                              
                          }.alert(isPresented: self.$showingAlert){
                            Alert(title: Text("Alerte"), message: Text("Veuillez Verifier vos coordonnées"), dismissButton: .default(Text("Revenir")))
                          }
            //Button Se Connecter
        }
            
            HStack(spacing: 20){
                Image("Line")
                Text("Ou")
                    .font(.custom("futura", size: 14))
                    .foregroundColor(Color("Blur"))
                Image("Line")
            } // Divider "Ou"

                loginViaFacebook()
                 .frame(width: 35, height: 40)
                  
              
             //   loginViaGoogle()
                //    .frame(width: 35, height: 40)
                 
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
                }.padding(.bottom, 15)
            }   // Conditions Generale   
        }
        .frame(alignment: .topLeading)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
           self.mode.wrappedValue.dismiss()
           }){
               HStack(spacing: 4){
                   Image(systemName: "chevron.compact.left")
                       .foregroundColor(.white)
                   Text("Acceuil")
                   .foregroundColor(.white)
                   }
           })

}

}

struct loginViaFacebook : UIViewRepresentable {
    
    func makeCoordinator() -> loginViaFacebook.Coordinator {
        return loginViaFacebook.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<loginViaFacebook>) -> FBLoginButton {
        let button = FBLoginButton()
        button.permissions = ["email"]
        button.delegate = context.coordinator
        return button
    }
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<loginViaFacebook>) {
    }
    
    class Coordinator : NSObject, LoginButtonDelegate {
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            if AccessToken.current != nil {
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                Auth.auth().signIn(with: credential){ (res, er) in
                    if er != nil {
                        print((er?.localizedDescription)!)
                        return
                    }
                    print("Success")
                }
            }
        }
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
        }
    }
}

func checkUser(completion: @escaping (Bool,String)->Void){
     
    let db = Firestore.firestore()
    
    db.collection("users").getDocuments { (snap, err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
        
        for i in snap!.documents{
            
            if i.documentID == Auth.auth().currentUser?.uid{
                
                completion(true,i.get("name") as! String)
                return
            }
        }
        
        completion(false,"")
    }
    
}







struct LoginCard_Previews: PreviewProvider {
    static var previews: some View {
        LoginCard()
    }
}


