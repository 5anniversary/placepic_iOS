//
//  groupListData.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct groupListData {
  
    var groupname: String
    var userCount: Int
    var postCount: Int
    var groupImage: String
    
    init(name: String, usercount: Int, postcount: Int, groupimage: String) {
        self.groupname = name
        self.userCount = usercount
        self.postCount = postcount
        self.groupImage = groupimage
        
    }
}
