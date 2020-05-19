//
//  User.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/12/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import Foundation

class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }

}
