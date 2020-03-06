//
//  LoginView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/5/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var selected=0
    var body: some View {
        ZStack(){
            Rectangle()
                .foregroundColor(Color("Background"))
            .edgesIgnoringSafeArea(.all)
            Spacer()
    VStack(){
        Spacer()
            Image("LoginIllust")
            .resizable()
            .frame(width: 220, height: 200)
                .padding(.all, 10)
        VStack(spacing: 10){
        Picker(selection: $selected, label: Text("")){
            
            Text("Inscrivez vous").tag(1)
            
            Text("Connectez Vous").tag(0)
        }.pickerStyle(SegmentedPickerStyle())
            if(self.selected == 0){
                LoginCard()
            }
            else{
                SignUpCard()
            }
        }.background(Color("secBackground"))
        .cornerRadius(20)
        }
        
            }
        }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

