//
//  Alert.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/6/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import Foundation
import Combine

struct Signal {
    let imageName: String
    let description: String
    let category: String
    let providedBy: String
    let localisation: String
}

class AlertModal: ObservableObject {
    
    @Published var alerts: [Signal] = []
    
    func localAlert() {
        alerts = [.init(imageName: "image", description: "C'est un alert ", category: "Poubelle", providedBy: "Anonyme", localisation: " ")]
    }
}
