//
//  Topview.swift
//  ITinder
//
//  Created by 水木大悟 on 2020/05/26.
//  Copyright © 2020 水木大悟. All rights reserved.
//

import SwiftUI

struct TopView : View {
    
    @Binding var show : Bool
    
    var body: some View{
        
        HStack{
            
            Button(action: {
                
            }) {
                
                Image("person").resizable().frame(width: 35, height: 35)
                
            }.foregroundColor(.gray)
            
            Spacer()
            
            Button(action: {
                
            }) {
                
                Image(systemName: "arkit").resizable().frame(width: 30, height: 35)
            }.foregroundColor(.green)
            
            Spacer()
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image("chat").resizable().frame(width: 35, height: 35)

            }.foregroundColor(.gray)
        
            
        }.padding()
    }
    
}

