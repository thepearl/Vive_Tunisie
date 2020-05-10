//
//  FillDetailsView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/5/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Firebase

struct FillDetailsView: View {
    @State private var showPic = false
    @State private var enableAirplaneMode = false
    @State var description: String = ""
    @State private var showDescriptionModal = false
    @State private var selectedType = 0
    @State private var selectedGov = 0
    @State var download_image:UIImage?
    @Binding var uid: String
    
    var TypeAnomalie = ["Poubelle", "Bancs", "Lampadaires", "Jardin publiques", "autre"]
    
    var gov = ["Tozeur", "Tunis", "Tataouine", "Sousse", "Monastir", "Mahdia", "Sfax", "Ben Arous", "Manouba", "Beja", "Jendouba", "Kef", "Kairouan", "Sidi Bouzid", "Kasserin", "Gafsa", "Kebili", "Gabes", "Djerjis", "Nabeul", "Bizerte", "Ariana", "Siliana"]
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
            VStack(){
                Form {
                    Section(header: Text("Informations necesssaires")){
                        Picker(selection: $selectedType, label: Text("Type d'anomalie")) {
                        ForEach(0..<TypeAnomalie.count) {
                            Text(self.TypeAnomalie[$0])
                        }
                    }//Type
                        HStack{
                            Button(action: {
                                self.showDescriptionModal = true
                            }){
                                HStack(){
                                Text("Description").foregroundColor(.black)
                            Spacer()
                                    Image(systemName: "pencil").foregroundColor(.black)
                                }.sheet(isPresented: $showDescriptionModal) {
                                    EditDescriptionView(popupDescriptionModal: self.$showDescriptionModal, desc: self.$description)
                                }
                            }
            
                        }
                
                    HStack {
                        Text("Fourni par ")
                        Spacer()
                        Text("Anonyme")
                    }
                    
                    Picker(selection: $selectedGov, label: Text("Localisation")) {
                        ForEach(0..<gov.count) {
                            Text(self.gov[$0])
                        }
                    }//Type
                    VStack(){
                        HStack{
                           Button(action: {
                
                            self.downloadPic()
                            self.showPic.toggle()
                                          
                                      }){
                                        if self.showPic{
                                            Text("Masquer l'image attachée").foregroundColor(.black)
                                        }
                                        else{
                                            Text("Afficher l'image attachée").foregroundColor(.black)
                                        }
                                      }
                            Spacer()
                            if self.showPic{
                            Image(systemName: "eye.slash")
                                    }
                            else{
                                Image(systemName: "eye")
                                }
                            }
                        }
                    } //Info Collectées
                }
                if download_image != nil && self.showPic == true {
                      Image(uiImage: download_image!)
                        .resizable()
                        .scaledToFit()
                        .frame(width:200 , height:150)
                        .padding(.bottom, 50)
                }
            }
            .navigationBarTitle(Text("Details"), displayMode: .large)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action : {
                  self.mode.wrappedValue.dismiss()
                      }){
                          HStack(spacing: 4){
                              Image(systemName: "chevron.compact.left")
                                  .foregroundColor(.white)
                              Text("Nouveau Signalement")
                                  .foregroundColor(.white)
                                }
                },
                trailing: Button(action: {
                    self.fillAlertData(uid: self.uid, category: "\(self.TypeAnomalie[self.selectedType])", description: self.description, user: "Anonyme", gov: "\(self.gov[self.selectedGov])"){ (status) in
                            if status
                              {
                                print("done")
                              }
                            else
                              {
                                print("error")
                              }
                    }
                }){
                    HStack(spacing: 4){
                        Text("Valider")
                        .foregroundColor(.white)
                          Image(systemName: "chevron.compact.right")
                              .foregroundColor(.white)
                            }
                    }
            )
    }
    
    func downloadPic() {
        Storage.storage().reference().child("alerts/image.jpg").getData(maxSize: 10 * 1024 * 1024){
        (imageData, err) in
            if let err = err {
                print("an error has occurred - \(err.localizedDescription)")
                  } else {
                      if let imageData = imageData {
                          self.download_image = UIImage(data: imageData)
                      } else {
                          print("couldn't unwrap image data image")
                }
                      
            }
        }
    }
    
    func fillAlertData(uid: String, category: String,description : String,user: String,gov : String,completion : @escaping (Bool)-> Void){
    
        let db = Firestore.firestore()
        db.collection("alerts").document(uid).setData(["uid":uid, "User":user, "TypeAnomalie":category,"Description":description]) { (err) in
                               
                               if err != nil{
                                   
                                   print((err?.localizedDescription)!)
                                   return
                               }
                               
                               completion(true)
                               
                               NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
    
    }

struct FillDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FillDetailsView(uid: .constant(" "))
    }
}
