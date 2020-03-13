//
//  SignUpController.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/12/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import Foundation
import Firebase

class SignUpController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        let db = Firestore.firestore()
        let newUser = db.collection("account").document()
        newUser.setData(["email": "exp@mail.dom", "gov": "gov", "id":newUser.documentID, "name":"root", "pass": "toor"])
    }
}
