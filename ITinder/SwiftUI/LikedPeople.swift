//
//  LikedPeople.swift
//  ITinder
//
//  Created by 水木大悟 on 2020/05/26.
//  Copyright © 2020 水木大悟. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct LikedPeople: View {
    
    @ObservedObject var datas = observer1()
    
    var body: some View {
        
        VStack{
            
            if datas.data.isEmpty{
                
                Text("あなたの仕事相手は1人もいません")
            }
            else{
                
                List(datas.data){i in
                    
//                    Text("hello world")
                    cards(name: i.name, image: i.image)
                }
            }
        }
    }
}

struct cards : View {
    
    
    var name = ""
    var image = ""
    var body: some View{
        
        HStack{
            
            AnimatedImage(url: URL(string: image)!).resizable().frame(width: 65, height: 65).clipShape(Circle())
            
            Text(name).fontWeight(.heavy)
        }
    }
    
}

class observer1 : ObservableObject {
    
    @Published var data = [datatype1]()
    
    init() {
        
        
        let db = Firestore.firestore()
        db.collection("liked").getDocuments{ (snap, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let name = i.get("name") as! String
                let age = i.get("age") as! String
                let image = i.get("image") as! String
                
                self.data.append(datatype1(name: name, age: age, image: image, id: UUID().uuidString))
            }
        }
        
    }
}


