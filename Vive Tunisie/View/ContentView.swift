//
//  ContentView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/5/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        Group{
            if (session.session == nil) {
                    HomeView()
            }else {
                HomeOnLoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView().colorScheme(.light)
        }
        
    }
}
