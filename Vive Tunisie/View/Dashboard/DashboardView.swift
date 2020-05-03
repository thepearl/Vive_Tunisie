      //
//  DashboardView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/21/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
                   Image("linux")
                       .resizable()
                        .frame(height: 140)
        
                   HStack {
                       VStack(alignment: .leading) {
                           Text("SwiftUI")
                               .font(.headline)
                               .foregroundColor(.secondary)
                           Text("Drawing a Border with Rounded Corners")
                               .font(.title)
                               .fontWeight(.black)
                               .foregroundColor(.primary)
                               .lineLimit(3)
                           Text("Written by Simon Ng".uppercased())
                               .font(.caption)
                               .foregroundColor(.secondary)
                       }
                       .layoutPriority(100)
        
                       Spacer()
                   }
                   .frame(height: 80)
                   .padding()
            }
               .cornerRadius(10)
               .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
               )
               .padding([.top, .horizontal])
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
