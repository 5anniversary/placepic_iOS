//
//  ResponseResult.swift
//  placepic
//
//  Created by elesahich on 2020/07/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var success: Bool
    var message: String?
    var data: [T]?
}
