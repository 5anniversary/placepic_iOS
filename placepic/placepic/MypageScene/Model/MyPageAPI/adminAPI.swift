//
//  adminAPI.swift
//  placepic
//
//  Created by 이유진 on 2020/07/09.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct adminAPI {
    static let getadminURL = GeneralAPI.baseURL+"/auth/groups/myInfo/10"
    static let acceptadminURL = GeneralAPI.baseURL+"/auth/groups/edit/10"
}
