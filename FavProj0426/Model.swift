//
//  Model.swift
//  FavProj0426
//
//  Created by 张亚飞 on 2022/4/26.
//

import Foundation

struct Item: Identifiable, Codable {
    
    var id: Int
    var title: String
    var descripption: String
    var isFaved: Bool
    
    static var simplaItems: [Item] {
        
        var tempList = [Item]()
        
        for i in 1...20 {
            
            let id = i
            let title = "Title \(i)"
            let description = "This is a sample description."
            
            tempList.append(Item(id: id, title: title, descripption: description, isFaved: false))
        }
        
        return tempList
    }
}
