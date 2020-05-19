//
//  EditDescriptionView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 5/6/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct EditDescriptionView: View {
    @Binding var popupDescriptionModal: Bool
    @State private var descriptionTextField = ""
    @Binding var desc: String 
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack(){
            HStack(){
                Spacer()
            }
            MultiLineTF(inputText: $descriptionTextField).border(Color.gray.opacity(0.5), width: 1)
            
            Spacer()
            Button(action: {
                self.desc = self.descriptionTextField
                print(self.desc)
                self.popupDescriptionModal.toggle()
                
            }){
                Text("Terminer")
                    .foregroundColor(.black)
            }
            Spacer()
            }
        }
    }


struct MultiLineTF: UIViewRepresentable  {
    
    @Binding var inputText : String
    
    func makeCoordinator() -> MultiLineTF.Coordinator {
        return MultiLineTF.Coordinator(parent1: self)
    }
        
    func makeUIView(context: UIViewRepresentableContext<MultiLineTF>) -> UITextView {
        let tview = UITextView()
        tview.isEditable = true
        tview.isUserInteractionEnabled = true
        tview.isScrollEnabled = false
        tview.text = "Description"
        tview.textColor = .black
        tview.font = .systemFont(ofSize: 20)
        tview.delegate = context.coordinator
        return tview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF>) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent : MultiLineTF
        init(parent1: MultiLineTF){
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.inputText = textView.text
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = UIColor.label
        }
        
    }
}
struct EditDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        EditDescriptionView(popupDescriptionModal: .constant(true), desc: .constant(""))
    }
}
