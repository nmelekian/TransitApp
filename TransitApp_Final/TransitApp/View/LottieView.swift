//
//  LottieView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/22/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    let lottieFile: String
    
    let animationView = LottieAnimationView()
    
    let animationSpeed: CGFloat
    
    func makeUIView(context: Context) -> UIViewType {
        let view = UIView(frame: .zero)
        
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = animationSpeed
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}
