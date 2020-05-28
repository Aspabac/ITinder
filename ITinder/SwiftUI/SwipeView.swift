//
//  SwipeView.swift
//  ITinder
//
//  Created by 水木大悟 on 2020/05/26.
//  Copyright © 2020 水木大悟. All rights reserved.
//

import SwiftUI

struct SwipeView : View{
    
    @EnvironmentObject var obser : observer
    var body: some View{
        
        GeometryReader{geo in
            
            ZStack{
                
                ForEach(self.obser.users){i in
                    
                    
                    SwipeDetailView(name: i.name, age: i.age, image: i.image, height: geo.size.height - 100).gesture(DragGesture()
                        
                        .onChanged({ (value) in
                            
                            if value.translation.width > 0{
                                
                                self.obser.update(id: i, value: value.translation.width, degree: 8)
                            }
                            else{
                               
                                
                                self.obser.update(id: i, value: value.translation.width, degree: -8)
                                
                            }
                        }).onEnded({ (value) in
                            
                            if i.swipe > 0{
                                
                                if i.swipe > geo.size.width / 2 - 80{
                                    
//                                    liked
                                    self.obser.update(id: i, value: 500, degree: 0)
                                    self.obser.updateDB(id: i, status: "liked")
                                    
                                    
                                }
                                else{
                                    
                                     self.obser.update(id: i, value: 500, degree: 0)
                                    }
                            }
                            else{
                                    
                                if -i.swipe > geo.size.width / 2 - 80{
                                    
//                                    reject
                                    self.obser.update(id: i, value: -500, degree: 0)
                                    self.obser.updateDB(id: i, status: "reject")
                                    
                                }
                                else{
                                    
                                     self.obser.update(id: i, value: 500, degree: 0)
                                    }
                            }
                            
                        })
                    
                    ).offset(x : i.swipe)
                    .rotationEffect(.init(degrees: i.degree))
                    .animation(.spring())
                }
            }
        }
    }
}
