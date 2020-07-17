//
//  APIConstants.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://3.34.209.95:3000"
//    static let baseURL = "http://172.30.1.56:3000"
//    static let baseURL = "http://172.30.1.26:3000"
    static let signinURL = APIConstants.baseURL + "/auth/signin"
    static let signupURL = APIConstants.baseURL + "/auth/signup"
    static let emailcheckURL = APIConstants.baseURL + "/auth/checkemail"
    static let mygrouplistURL = APIConstants.baseURL + "/auth/groups"// 내그룹 목록
    static let waitgrouplistURL = APIConstants.baseURL + "/auth/groups?filter=wait"//승인대기 그룹목록
    static let applygrouplistURL = APIConstants.baseURL + "/auth/groups/apply"//신청가능 그룹목록
    static let applygroupURL = APIConstants.baseURL + "/auth/groups/apply/"
}
