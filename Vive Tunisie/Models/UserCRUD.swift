//
//  UserCRUD.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/26/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import Firebase
import FirebaseFirestore

let dbCollection = Firestore.firestore().collection("users")
let firebaseData = FirebaseData()

class FirebaseData: ObservableObject {
    
    @Published var data = [User]()
    
    init() {
        readUser()
    }
    
    func createUser(id:String, name:String, email:String, pass:String, gov:String)  {
        dbCollection.document().setData(["id" : dbCollection.document().documentID, "name" : name, "email" : email, "pass" : pass, "gov" : gov]){ (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else{
                print("Create user with success")
            }
        }
    }
    func readUser(){
       let listener = dbCollection.addSnapshotListener{( documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else{
                print("read User Data with Scuess")
            }
            documentSnapshot!.documentChanges.forEach{ diff in
               // Real time creation by user to server
                if (diff.type == .added){
                    let msgData = User(id: diff.document.documentID , email: diff.document.get("email") as! String, pass: diff.document.get("pass") as! String, name: diff.document.get("name") as! String, gov: diff.document.get("gov") as! String )
                    self.data.append(msgData)
                }
                // Real time midfication by user to server
                if (diff.type == .modified){
                    self.data = self.data.map{ (eachData) -> User in
                        var data = eachData
                        if data.id == diff.document.documentID{
                            data.name = diff.document.get("name") as! String
                            data.gov = diff.document.get("gov") as! String
                            data.email = diff.document.get("email") as! String
                            data.pass = diff.document.get("pass") as! String
                            return data
                        }else{
                            return eachData
                        }
                    }
                }
            }
        }
        listener.remove()    }
    
    func deleteUser(datas: FirebaseData, index: IndexSet) {
        let id = datas.data[index.first!].id
        dbCollection.document(id).delete{ (err) in
            if err != nil {
                  print((err?.localizedDescription)!)
                return
            }else{
                print("User deleted with succes")
            }
            datas.data.remove(atOffsets: index)
        }
    }
    
    func updateUser(id: String, attribute:String, updateToDo:String  ) {
        dbCollection.document(id).updateData([attribute: updateToDo]) { (err) in
            if err != nil{
                print((err?.localizedDescription)!)
            }else{
                print("User Updated with succes")
            }
        }
    }
    
    func getUserCoord(){
        let user = Auth.auth().currentUser
        if let user = user {
          
          let uid = user.uid
          let email = user.email
            let userName = user.displayName
          
        }
    }
}

