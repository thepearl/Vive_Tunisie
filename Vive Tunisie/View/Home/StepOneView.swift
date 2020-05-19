//
//  StepOneView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/14/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct StepOneView: View {
    @State var imageName: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.offWhite)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.offWhite)
                .frame(width: 275, height: 160)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -2.5, y: -2.5)
            Image(imageName)
            .resizable()
            .frame(width: 200, height: 125)
        }
    }
}

struct StepOneView_Previews: PreviewProvider {
    static var previews: some View {
        StepOneView(imageName: " ")
    }
}
