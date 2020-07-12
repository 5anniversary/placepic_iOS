//
//  UsefulImformModel.swift
//  placepic
//
//  Created by elesahich on 2020/07/12.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - UsefulInformModel
struct UsefulInformModel: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let data: [UsefulInformData]?
}

// MARK: - Datum
struct UsefulInformData: Codable {
    let tagIdx: Int?
    let tagName: String?
    let tagIsBasic, categoryIdx: Int?
}
