//
//  NewSignalView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/4/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import FirebaseStorage

struct NewSignalView: View {
    
    
    @State var showSourceActionSheet = false
    @State var showImagePicker = false
    @State var isLoading = false
    @State var isNextButtonEnabled = false
    @State var noImageSelected = false
    @State var activateNextButtonBg = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State var upload_image:UIImage?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var uid = UUID().uuidString
    
    
    var body: some View {
        //I need to finish is NextBnt Enabled, only when pic uploaded success
        VStack(){
            VStack(spacing: 5){
                
                Text(" Veuillez ajouter l'image du scene detecté")
                    .font(.custom("Optima", size: 18))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding()
                VStack(spacing: 15){
                buildCard(cardPictureName: "CamPic", cardMessage: "Selectionner")
                //Button for upload
                          Button(action: {
                              if let thisImage = self.upload_image {
                                self.isLoading = true
                                self.uploadImage(image: thisImage)
                                self.noImageSelected = false
                              } else {
                                self.noImageSelected = true
                              }
                              
                          }){
                              Text("Ajouter l'image selectionnée")
                                .font(.custom("Optima", size: 16))
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(6)
                                .shadow(radius: 1)
 
                          }.alert(isPresented: self.$noImageSelected){
                            Alert(title: Text("Alerte"), message: Text("Aucune Image Selectionée"), dismissButton: .default(Text("Revenir")))
                          }
                if self.isLoading{
                    VStack(spacing:10){
                        Text("Veuillez attendre jusqu'à ce que l'image est importée").font(.custom("Optima", size: 16))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding()
                        LoadingView()
                    }
                    }
                }
                Spacer()
                
                HStack(spacing : 15){
                    NavigationLink(destination: FillDetailsView(description: " ", uid: $uid)){
                        if activateNextButtonBg{
                            Text("Suivant").foregroundColor(.blue)
                        }
                        else{
                            Text("Suivant").foregroundColor(.gray)
                        }
                        Image(systemName: "chevron.compact.right")
                    }
                    
                }.disabled(!self.isNextButtonEnabled)
            }
            Spacer()
            Image("BotView")
        }.background(Color("secBackground"))
         .edgesIgnoringSafeArea(.bottom)
         .navigationBarTitle(Text("Nouveau Signalement"), displayMode: .large)
         .navigationBarBackButtonHidden(true)
         .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
            }){
                HStack(spacing: 4){
                    Image(systemName: "chevron.compact.left")
                        .foregroundColor(.white)
                    Text("Acceuil")
                    .foregroundColor(.white)
                    }
            })
    }
    
    func buildCard(cardPictureName: String, cardMessage: String) -> some View {
        Button(action: {
             self.showSourceActionSheet = true
        }){
        VStack(spacing: 5){
                Image(cardPictureName)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 125, height: 100)
                    .aspectRatio(contentMode: .fit)
                Text(cardMessage)
                    .font(.custom("Optima", size: 16))
                    .multilineTextAlignment(.center)
            }
            .frame(width: 175 ,height: 150)
            .background(Color.white)
            .border(Color.blue ,width: 1)
            .cornerRadius(10)
            .actionSheet(isPresented: $showSourceActionSheet){
                ActionSheet(title: Text("Selectionner le source"), message: nil, buttons: [
                    //Button1
                    
                    .default(Text("Camera"), action: {
                        self.showImagePicker = true
                        self.sourceType = .camera
                    }),
                    //Button2
                    .default(Text("Gallerie"), action: {
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    }),
                    
                    //Button3
                    .cancel(Text("Annuler"))
                    
                ])
            }.sheet(isPresented: $showImagePicker){
                imagePicker(image: self.$upload_image, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
            }
        }
    }
    
    func uploadImage(image:UIImage){
        if let imageData = image.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            let newMetadata = StorageMetadata()
            newMetadata.cacheControl = "public,max-age=300";
            newMetadata.contentType = uid;

            storage.reference().child("alerts/image.jpg").putData(imageData, metadata: newMetadata){
                (_, err) in
                if let err = err {
                    self.isLoading = false
                    print("an error has occurred during uploading :  \(err.localizedDescription)")
                } else {
                    self.isLoading = false
                    self.isNextButtonEnabled = true
                    self.activateNextButtonBg = true
                }
            }
        } else {
            self.isLoading = false
            print("coldn't unwrap/case image to data")
        }
        
    }
}



struct NewSignalView_Previews: PreviewProvider {
    static var previews: some View {
        NewSignalView()
    }
}
