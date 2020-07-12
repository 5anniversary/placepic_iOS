//
//  groupListData.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct groupListData {
  
    var groupImage: String
    var groupname: String
    var userCount: Int
    var postCount: Int
   
    
    init(groupimage: String,name: String, usercount: Int, postcount: Int) {
        
        self.groupImage = groupimage
        self.groupname = name
        self.userCount = usercount
        self.postCount = postcount
        
        
    }
}

