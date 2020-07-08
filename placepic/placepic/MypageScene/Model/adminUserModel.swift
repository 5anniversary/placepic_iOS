//
//  adminUserModel.swift
//  placepic
//
//  Created by 이유진 on 2020/07/09.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct adminUserModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [WaitUserModel]
}

// MARK: - DataClass
struct DataClass: Codable {
    let waitUserList: [WaitUserModel]
}

// MARK: - WaitUserList
struct WaitUserModel: Codable {
    let userIdx, groupUserIdx, groupIdx, state: Int
    let part, phoneNumber, email, password: String
    let salt: String
    let profileImageURL: String
    let userName: String
    let gender: Int
    let profileThumbNailImageURL: String
    let userCreatedAt, userBirth: String

    enum CodingKeys: String, CodingKey {
        case userIdx, groupUserIdx, groupIdx, state, part, phoneNumber, email, password, salt
        case profileImageURL = "profileImageUrl"
        case userName, gender
        case profileThumbNailImageURL = "profileThumbNailImageUrl"
        case userCreatedAt, userBirth
    }
}
