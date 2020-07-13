//
//  adminListModel.swift
//  placepic
//
//  Created by 이유진 on 2020/07/06.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct adminListModel {
    var name:String
    var birth:String
    var part:String
    var phone:String
    var gender:String
    
//    init(mainimg:String, name: String, price: String, subinfo: [Bool]) {
//        self.mainimg = mainimg
//        self.name = name
//        self.price = price
//        self.subinfo = subinfo
//    }
    init(name:String, birth:String, part:String, phone:String, gender:String){
        self.name = name
        self.birth = birth
        self.part = part
        self.phone = part
        self.gender = gender
    }
}
