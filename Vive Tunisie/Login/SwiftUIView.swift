//
//  SwiftUIView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/13/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Firebase

struct SwiftUIView: View {
    let login = LoginView()
    var body: some View {
        HStack{
            Button(action: {
                 let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    NavigationLink(destination: self.login,
                    label: { EmptyView() })
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
                }
            }){
                Text("SignOut")
                    .foregroundColor(.red)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
