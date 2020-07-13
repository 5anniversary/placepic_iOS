//
//  GroupListmodel.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/10.
//  Copyright © 2020 elesahich. All rights reserved.

import Foundation

// MARK: - Welcome
struct GroupListmodel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [groupData]
}

// MARK: - Datum
struct groupData: Codable {
    let groupIdx, groupUserIdx, userIdx, state: Int
    let part, phoneNumber, groupName: String //groupname
    let groupImage: String
    let userCount, postCount: Int // userCount postCount

    enum CodingKeys: String, CodingKey {
        case groupIdx, groupUserIdx, userIdx, state, part, phoneNumber, groupName, groupImage
        case userCount = "userCount"
        case postCount = "postCount"
    }
}

