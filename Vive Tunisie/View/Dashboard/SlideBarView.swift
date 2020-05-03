//
//  SlideBarView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 4/6/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct SlideBarView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            Button(action: {
                
            }){
                HStack(spacing: 10){
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Profile")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 30)
            }
            
            Button(action: {
                
            }){
                HStack(spacing: 10){
                    Image(systemName: "text.badge.checkmark")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Mes\nSignalements")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 30)
            }
            
            Button(action: {
                
            }){
                HStack(spacing: 10){
                    Image(systemName: "bookmark")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Favoris")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 30)
            }
            
            Button(action: {
                
            }){
                HStack(spacing: 10){
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Parametres")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 30)
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("Background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SlideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SlideBarView()
    }
}
