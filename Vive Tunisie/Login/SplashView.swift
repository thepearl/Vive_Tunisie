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
    let login = LoginView()
    @State private var isActive = false

    var body: some View {
        NavigationView{
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
            NavigationLink(destination: login,
                               isActive: $isActive,
                               label: { EmptyView() })
            }.onAppear(perform: {
                self.gotoLoginScreen(time: 2.5)
            })
                       }
                   }


func gotoLoginScreen(time: Double) {
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
        self.isActive = true
    }
}
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
