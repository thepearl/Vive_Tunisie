//
//  SplashView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/5/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 25){
            Image("Logo")
            .resizable()
            .frame(width: 110, height: 170)
            
            Text("Vive Tunisie")
                .font(.largeTitle)
            .foregroundColor(Color("Text"))
            }.background(Color(.white))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
