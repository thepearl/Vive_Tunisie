//
//  User.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/12/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import Foundation
import Firebase
import Combine

struct User: Identifiable{
    var id: String
    var email: String
    var pass: String
    var name: String
    var gov: String
}

class getUserData: ObservableObject {
    @Published var data = [User]() 
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("users").addSnapshotListener{ (snap, err) in
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let gov = i.document.get("gov") as! String
                let email = i.document.get("email") as! String
                let pass = i.document.get("pass") as! String
                
                self.data.append(User(id: id, email: email, pass: pass, name: name, gov: gov))
            }
    }
}
}
