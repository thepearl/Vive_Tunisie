//
//  TasksCollectionView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 3/23/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct TasksCollectionView: View {
    @ObservedObject private var datas = firebaseData
    var body: some View {
        VStack(spacing:20)
            {
                HStack(spacing: 17.5){
                    makeTaskView(imageName: "house", description: "Accueil")
                    makeTaskView(imageName: "text.badge.checkmark", description: "Mes\nSignalements")
                    makeTaskView(imageName: "bookmark", description: "Favoris")

            }
                HStack(spacing: 17.5){
                    makeTaskView(imageName: "skew", description: "Statistiques")
                    makeTaskView(imageName: "gear", description: "Paramétres")
                    makeTaskView(imageName: "exclamationmark.circle", description: "Support")
            }
        }
    }
}
    


func makeTaskView(imageName:String, description:String) -> some View{
    VStack(alignment:.center, spacing: 10){
            Image(systemName: imageName).resizable().scaledToFit()
                .foregroundColor(Color(.systemGray2))
                
            Text(description)
                .foregroundColor(Color(.black))
                .font(.custom("futura", size: 12))
                .autocapitalization(.words)

               
        }
        .frame(width: 65, height: 75, alignment: .leading)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
            .stroke(Color.white, lineWidth: 4)
            .shadow(radius: 1, x: 0, y: 1)
            )
    }



struct TasksCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        TasksCollectionView().colorScheme(.light)
            TasksCollectionView().colorScheme(.dark)
        }
    }
}
