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
    @State private var showDescriptionModal = false
    @State private var validate = false
    @State var description: String = ""
    @State private var selectedType = 0
    @State private var selectedGov = 0
    @State var download_image:UIImage?
    @Binding var imageUid: String
    var userUid = Auth.auth().currentUser
    
    var TypeAnomalie = ["Poubelle", "Bancs", "Lampadaires", "Jardin publiques", "Feux tricolores","Feux tricolores", "Animaux", "autre"]
    @ObservedObject var fetcher = MovieFetcher()
    
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
                        if(userUid?.uid != nil){
                            Text("Fourni par")
                            Spacer()
                            Text("\((userUid?.email)!)")
                        }
                        else{
                            Text("Fourni par ")
                            Spacer()
                            Text("Anonyme")
                        }
                    }
                    
                    Picker("Governaurat" , selection: $selectedGov){
                        ForEach(fetcher.movies) { gov in
                            VStack(){
                                Text(gov.name_fr).foregroundColor(.black)
                                Text(gov.name_ar).foregroundColor(.gray)
                            }
                        }
                        
                    }//Gov
                        
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
                    
                    self.fillAlertData(uid: self.imageUid, category: "\(self.TypeAnomalie[self.selectedType])", description: self.description, user: " ", gov: self.selectedGov){ (status) in
                            if status
                              {
                                print("done")
                                self.validate = true
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
        
        .popup(isPresented: $validate, type: .`default`) {
            VStack(spacing: 10) {
                Image("Validate")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 150, height: 125)
                
                Text("Signalement terminé")
                    .foregroundColor(.black)
                    .fontWeight(.bold)

                Text("Le rapport de signalement est enregistré dans notre base de donnée, on vous remerci de faire votre droit civique.")
                    .font(.system(size: 14))
                    .foregroundColor(Color(.black))
                    .multilineTextAlignment(.center)
                    .lineLimit(4)

                Spacer()

                Button(action: {
                    self.validate = false
                }) {
                    Text("Terminer")
                        .font(.system(size: 15))
                        .foregroundColor(Color(.white))
                        .fontWeight(.bold)
                }
                .frame(width: 120, height: 40)
                .background(Color("Date"))
                .cornerRadius(15.0)
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 40, trailing: 20))
            .frame(width: 300, height: 400)
            .background(Color(.white))
            .cornerRadius(10.0)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        }



    }
    
    func downloadPic() {
        Storage.storage().reference().child("\(imageUid).jpg").getData(maxSize: 10 * 1024 * 1024){
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
    
    func fillAlertData(uid: String, category: String,description : String, user: String,gov : Int,completion : @escaping (Bool)-> Void){
    
        let db = Firestore.firestore()
        if((userUid) != nil){
            db.collection("alerts").document(uid).setData(["imageUid":uid, "UserUid":userUid?.uid, "TypeAnomalie":category,"Description":description, "Created_At": Date(), "Gov": gov]) { (err) in
                   
                   if err != nil{
                       
                       print((err?.localizedDescription)!)
                       return
                   }
                   
                   completion(true)
                   
                   NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                }
            }
        else
        {
            db.collection("alerts").document(uid).setData(["imageUid":uid, "UserUid":"Anonyme", "TypeAnomalie":category,"Description":description, "Created_At": Date(), "Gov": gov]) { (err) in
               
               if err != nil{
                   
                   print((err?.localizedDescription)!)
                   return
               }
               
               completion(true)
               
               NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            }
        }
        
        }
    }

struct FillDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FillDetailsView(imageUid: .constant(" "))
    }
}
