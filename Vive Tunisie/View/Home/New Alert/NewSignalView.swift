//
//  NewSignalView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/4/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import ExytePopupView


struct NewSignalView: View {
    



    @State var showSourceActionSheet = false
    @State var showImagePicker = false
    @State var isLoading = false
    @State var isNextButtonEnabled = false
    @State var noImageSelected = false
    @State var imageImported = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State var upload_image:UIImage?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var uid = UUID().uuidString
    
    
    var body: some View {
        ZStack(){
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
                                           .foregroundColor(.black)
                                           .font(.custom("Optima", size: 16))
                                           .multilineTextAlignment(.center)
                                           .padding()
                                           .background(Color.offWhite)
                                           .cornerRadius(6)
                                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                           .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

            
                                     }
                            
                           if self.isLoading{
                               VStack(spacing:10){
                                   Text("Veuillez attendre jusqu'à ce que l'image est importée")
                                   .font(.custom("Futura", size: 16))
                                   .multilineTextAlignment(.center)
                                   UploadingView()
                                    }.frame(width: 300)
                               }
                           }
                           Spacer()
                           
                           HStack(spacing : 15){
                               NavigationLink(destination: FillDetailsView(description: " ", imageUid: $uid)){
                                   if isNextButtonEnabled{
                                     Text("Suivant")
                                        .font(.custom("Optima", size: 18))
                                        .foregroundColor(.white)
                                   }
                                   else{
                                      EmptyView()
                                   }
                                   
                               }
                               
                           }.disabled(!self.isNextButtonEnabled)
                        .buttonStyle(GradientBackgroundStyle())
                }
                       Spacer()
                       Image("BotView")
            }.background(Color.offWhite)
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
        .popup(isPresented: self.$noImageSelected, type: .`default`) {
            VStack(spacing: 10) {
                Image("Warning")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 125, height: 125)

                Text("Aucune Photo Selectionnée")
                    .foregroundColor(.black)
                    .fontWeight(.bold)

                Text("Vous devez selectionner la photo avant de l'importer.")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)

                Spacer()

                Button(action: {
                    self.noImageSelected = false
                }) {
                    Text("D'accord")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                 .frame(width: 120, height: 40)
                 .background(Color("Date"))
                 .cornerRadius(15.0)
            }
            .padding(EdgeInsets(top: 70, leading: 20, bottom: 40, trailing: 20))
            .frame(width: 300, height: 400)
            .background(Color(.white))
            .cornerRadius(10.0)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        }
            
        .popup(isPresented: self.$imageImported, type: .toast, position: .bottom, animation: .spring(), autohideIn: 1, closeOnTap: true) {
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: "icloud.and.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fill)
                        .frame(width: 50, height: 50)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Photo est importée")
                            .foregroundColor(.black)
                            .fontWeight(.bold)

                        Text("Veuillez nous fournir de quleques informations en cliquant sur Suivant")
                            .lineLimit(2)
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                }
                Spacer(minLength: 10)
            }
            .padding(15)
            .frame(width: UIScreen.main.bounds.width, height: 120)
            .background(Color("secBackground"))
        }
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
                    .foregroundColor(.black)
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
            newMetadata.contentType = uid;

            storage.reference().child("\(uid).jpg").putData(imageData, metadata: newMetadata){
                (_, err) in
                if let err = err {
                    self.isLoading = false
                    print("an error has occurred during uploading :  \(err.localizedDescription)")
                } else {
                    self.isLoading = false
                    self.imageImported = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2 ){
                        self.isNextButtonEnabled = true
                    }
                }
            }
        } else {
            self.isLoading = false
            print("coldn't unwrap/case image to data")
        }
        
    }
}

struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 150)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 224/255, green: 144/255, blue: 144/255), Color(red: 224/255, green: 144/255, blue: 144/255)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}

struct NewSignalView_Previews: PreviewProvider {
    static var previews: some View {
        NewSignalView()
    }
}
