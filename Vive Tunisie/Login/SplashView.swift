//
//  SplashView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/5/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @State private var half = true
    @State private var dim = true
    var body: some View {
        
        VStack(spacing: 25){
            Image("Logo")
                .resizable()
                .scaleEffect(half ? 0.5 : 1.0)
                .opacity(dim ? 0.2 : 1.0)
                .frame(width: 110, height: 170)
                .animation(.easeInOut(duration: 1.0))
                .onAppear() {
                    self.dim.toggle()
                    self.half.toggle()
                    }
            Text("Vive Tunisie")
                .font(.largeTitle)
            .foregroundColor(Color("Text"))
            
            }
        
    }
    }


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
