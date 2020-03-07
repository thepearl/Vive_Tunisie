//
//  SignUpCard.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/6/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
struct SignUpCard: View {
    @State private var name = ""
    @State var value : CGFloat = 0
    var body: some View {
         VStack(spacing: 10){
            TextField("Courrier électronique", text: $name)
            .foregroundColor(Color("Text"))
            .keyboardType(.emailAddress)
        }
}
}
struct SignUpCard_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCard()
    }
}
