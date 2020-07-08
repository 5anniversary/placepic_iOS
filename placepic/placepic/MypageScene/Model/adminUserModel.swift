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

// MARK: - Datum
struct WaitUserModel: Codable {
    let userIdx, groupUserIdx, groupIdx, state: Int
    let part, phoneNumber, email, password: String
    let salt: String
    let profileImageURL: String
    let userName: String
    let gender: Int
    let profileThumbNailImageURL: String?
    let userCreatedAt: Int
    let userBirth: String

    enum CodingKeys: String, CodingKey {
        case userIdx, groupUserIdx, groupIdx, state, part, phoneNumber, email, password, salt
        case profileImageURL = "profileImageUrl"
        case userName, gender
        case profileThumbNailImageURL = "profileThumbNailImageUrl"
        case userCreatedAt, userBirth
    }
}
