//
//  NetworkResultforGroup.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/18.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation


enum NetworkResultforGroup<T> {
    case success(T,T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
