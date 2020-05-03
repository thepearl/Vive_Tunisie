//
//  LottieView.swift
//  Vive Tunisie
//
//  Created by Ghazi Tozri on 4/3/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    var filename: String
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView{
        
        //Njarreb UI kit views .. Result : SwiftUi is easier :(
        let view = UIView(frame: .zero)
    
        let animationView = AnimationView()
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
