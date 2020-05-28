//
//  Loader.swift
//  ITinder
//
//  Created by 水木大悟 on 2020/05/26.
//  Copyright © 2020 水木大悟. All rights reserved.
//

import SwiftUI


struct Loader : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
     
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
}
