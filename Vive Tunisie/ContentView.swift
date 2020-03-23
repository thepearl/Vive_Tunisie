//
//  ContentView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/5/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TasksCollectionView()
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView().colorScheme(.light)
            ContentView().colorScheme(.dark)
        }
        
    }
}
