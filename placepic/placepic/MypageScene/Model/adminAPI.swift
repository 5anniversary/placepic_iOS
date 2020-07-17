//
//  adminAPI.swift
//  placepic
//
//  Created by 이유진 on 2020/07/09.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct adminAPI {
    static let getadminURL = GeneralAPI.baseURL+"/auth/groups/admin/1"
    static let acceptadminURL = GeneralAPI.baseURL+"/auth/groups/admin/edit/1"
    static let deletadminURL = GeneralAPI.baseURL+"/auth/groups/admin/delete/1"
    static let mypageURL = GeneralAPI.baseURL + "/auth/myInfo/1"
}
