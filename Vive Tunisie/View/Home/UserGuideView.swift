//
//  UserGuideView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/14/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct UserGuideView: View {

    var body: some View {
        ScrollView(.vertical)
            {
                VStack()
                {
                HStack
                    {
                    Text("Détection d'une anamolie")
                    .font(.custom("Optima", size: 22))
                    .multilineTextAlignment(.leading)
                    .edgesIgnoringSafeArea(.leading)
                    .foregroundColor(.black)
                    .padding(.leading)
                    .padding(.top, 20)
                    Spacer()
                }.padding(.bottom,10)
                    StepOneView(imageName: "StepOne")
            }.padding(.bottom, 30)
                VStack()
                    {
                        HStack{
                            Text("Fournir un alerte")
                            .font(.custom("Optima", size: 22))
                            .multilineTextAlignment(.leading)
                            .edgesIgnoringSafeArea(.leading)
                            .foregroundColor(.black)
                            .padding(.leading)
                            Spacer()
                        }.padding(.bottom,10)
                        
                        ScrollView(.horizontal,showsIndicators: false)
                        {
                            HStack(spacing: 25)
                            {
                                VStack(spacing: 15)
                                {
                                 StepOneView(imageName: "CamPic")
                                    Text("Prendre une photo de l'anomalie")
                                    .font(.custom("Optima", size: 16))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                }
                                VStack(spacing: 15)
                                {
                                 StepOneView(imageName: "UploadPic")
                                    Text("Importer l'image prise")
                                    .font(.custom("Optima", size: 16))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                }
                                VStack(spacing: 15)
                                {
                                 StepOneView(imageName: "Validate")
                                    Text("Valider les informations fournies")
                                    .font(.custom("Optima", size: 16))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                }
                            }
                        }
                        .padding(.leading, 10)
                        .background(Color.offWhite)
                        
                VStack()
                    {
                        HStack()
                            {
                                Text("Et aprés ?")
                                .font(.custom("Optima", size: 22))
                                .multilineTextAlignment(.leading)
                                .edgesIgnoringSafeArea(.leading)
                                .foregroundColor(.black)
                                .padding(.leading)
                                .padding(.top, 20)
                                Spacer()
                        }
                        VStack()
                            {
                                StepOneView(imageName: "Server")
                        
                        Text("Le rapport sera enregistré dans notre base des données et sera traités par notre admin pour envoyer chaque alerte aux agences publiques selon le type d'anomalie et la region concernée. ")
                            .font(.custom("Optima", size: 18))
                            .multilineTextAlignment(.leading)
                            .lineLimit(8)
                            .frame(height: 125)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)

                        }
                    }
                }
        }
        .background(Color.offWhite)
    }
}

struct UserGuideView_Previews: PreviewProvider {
    static var previews: some View {
        UserGuideView()
    }
}
