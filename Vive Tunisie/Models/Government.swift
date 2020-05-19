//
//  Government.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/7/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import Foundation

struct Movie: Decodable, Identifiable {
    public var id: Int
    public var name_ar: String
    public var name_fr: String
    
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case name_ar = "name_ar"
           case name_fr = "name_fr"
        }
}

public class MovieFetcher: ObservableObject {
    @Published var movies = [Movie]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://gist.githubusercontent.com/thepearl/8d00720cbfe5affc95d8d339aaffc687/raw/ef27a47f0127df244225309098097af2d68973c8/Gov.json")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Movie].self, from: d)
                    DispatchQueue.main.async {
                        self.movies = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
         
    }
}


