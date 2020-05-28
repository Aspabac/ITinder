//
//  SwipeDetailView.swift
//  ITinder
//
//  Created by 水木大悟 on 2020/05/26.
//  Copyright © 2020 水木大悟. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SwipeDetailView : View {
    
    var name = ""
    var age = ""
    var image = ""
    var height : CGFloat = 0
    
    
    var body: some View{
        
        ZStack{
            
            AnimatedImage(url: URL(string: image)!).resizable().cornerRadius(20).padding(.horizontal,15)
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    VStack(alignment: .leading, content: {
                        
                        
                        Text(name).fontWeight(.heavy).font(.system(size:20)).foregroundColor(.white)
                        Text(age).foregroundColor(.white).foregroundColor(.white)
                        
                    })
                        
                    Spacer()
                }
            }.padding([.bottom,.leading],35)
            
            
        }.frame(height : height)
    }
    
    
    
}
