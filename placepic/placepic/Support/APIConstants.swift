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
    static let signinURL = APIConstants.baseURL + "/auth/signin"
    static let signupURL = APIConstants.baseURL + "/auth/signup"
    static let emailcheckURL = APIConstants.baseURL + "/auth/checkemail"
}
