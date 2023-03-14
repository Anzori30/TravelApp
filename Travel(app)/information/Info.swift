//
//  Info.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

struct Setting {
    let listName:String
}
struct ImageUrl {
    let image:UIImage
}
//struct PhotoUrl{
//    let image:URL
//}
struct User {
    let name: String
    let photo: [String: [String]]
    let location: String
    let description: String
    let type: String
    let star:Int
    let price: String
    let person:Int
    func toDictionary() -> [String:Any] {
        return [
            "photo":photo,
            "name": name,
            "location": location,
            "description": description,
            "type": type,
            "star":star,
            "price":price,
            "person":person
        ]
    }
}
