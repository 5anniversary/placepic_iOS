//
//  categoryIndex.swift
//  placepic
//
//  Created by elesahich on 2020/07/16.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

enum CategoryIndex: String {
    case one = "전체"
    case two = "맛집"
    case three = "술집"
    case four = "카페"
    case five = "스터디"
}

extension CategoryIndex {
    var index: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        }
    }
}

