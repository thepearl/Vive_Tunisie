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
    @State var value :CGFloat = 0
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   
    var body: some View {
        NavigationView{
            VStack(){
                    VStack(){
                    Image("LoginIllust")
                    .resizable()
                    .frame(width: 175, height: 125)
                    .padding(.all, 10)
                VStack(spacing: 15){
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
                .offset(y: -self.value)
                                       .animation(.spring()).onAppear(){
                                             NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main){ (noti) in
                                                 let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                                                 let height = value.height
                                                 self.value = height
                                             }
                                             NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main){ (n) in
                                                       self.value = 0
                                       }
                
                    }
                   
            }   
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

