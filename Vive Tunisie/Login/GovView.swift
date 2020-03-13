//
//  GovView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/12/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct GovView: View {
    init()
    {
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
    }

    @State private var govIndex = 0
    var govs = ["Ariana", "Béja", "Ben Arous", "Bizerte", "Gabès", "Gafsa", "Jendouba", "Kairouan", "Kasserine", "Kébili", "Kef", "Mahdia", "La Manouba", "Médenine", "Monastir", "Nabeul", "Sfax", "Sidi Bouzid", "Siliana" , "Sousse", "Tataouine", "Tozeur", "Tunis", "Zaghouan" ]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker(selection: $govIndex, label: Text("Governaurat")){
                    ForEach(0 ..< govs.count){
                        Text(self.govs[$0]).tag($0)
                        }
                    }
                }
            }
        }
    }
}

struct GovView_Previews: PreviewProvider {
    static var previews: some View {
        GovView()
    }
}
