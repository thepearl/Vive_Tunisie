//
//  SignoutView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/13/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Firebase

struct SignoutView: View {

    var body: some View {
        HStack{
                   Button(action: {
                        let firebaseAuth = Auth.auth()
                       do {
                         try firebaseAuth.signOut()
                           print("done")
                       } catch let signOutError as NSError {
                         print ("Error signing out: %@", signOutError)
                       }
                   }){
                       Text("Deconnexion")
                           .foregroundColor(.red)
                   }
               }
    }
}

struct SignoutView_Previews: PreviewProvider {
    static var previews: some View {
        SignoutView()
    }
}
