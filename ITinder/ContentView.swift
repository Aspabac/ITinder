//
//  ContentView.swift
//  ITinder
//
//  Created by 水木大悟 on 2020/05/25.
//  Copyright © 2020 水木大悟. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI


struct ContentView: View {
    
    @EnvironmentObject var obs : observer
    @State var showLiked = false
    
    var body: some View {
        
       
        ZStack{
            
            Color("LightWhite").edgesIgnoringSafeArea(.all)
            
            if obs.users.isEmpty {
                 Loader()
            }
            
           
            
            VStack {
                           
                TopView(show: $showLiked)
                           
                SwipeView()
                           
                BottomView()
                
            }
                   
        }.sheet(isPresented: $showLiked) {
            
           LikedPeople()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}















//you can see that seen users are not displaying in the list..
//in general zstack will overlay one view on another view so first
//index will be shown at last as well as last index will shown will be first..
//time to clean code..
