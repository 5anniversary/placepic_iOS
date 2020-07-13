//
//  NetworkResult.swift
//  placepic
//
//  Created by 이유진 on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
