//
//  Government.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/7/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import Foundation
struct Collection: Decodable {
    let type:String
    let features: [Features]
}

struct Features: Decodable {
    let type: String
    let properties: Properties
}

struct Properties: Decodable {
    let id: String
    let boundary: String
    let name: String
}


class Gov: ObservableObject {
    @Published var alertGov = [Collection]()
    
    init() {
        load()
    }
    
    func load() {
        let urlBar = Bundle.main.url(forResource: "municipalites", withExtension: "geojson")!

        do {
            let jsonData = try Data(contentsOf: urlBar)
            let result = try JSONDecoder().decode(Collection.self, from: jsonData)
            for feature in result.features {
                print("boundary", feature.properties.boundary, "name", feature.properties.name)
            }
        } catch { print("Error while parsing: \(error)") }
    }
}


