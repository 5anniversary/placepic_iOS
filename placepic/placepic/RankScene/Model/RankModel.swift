//
//  RankModel.swift
//  placepic
//
//  Created by elesahich on 2020/07/16.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

// MARK: - Empty
struct RankModel: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let data: RankDataClass?
}

// MARK: - DataClass
struct RankDataClass: Codable {
    let userCnt: Int?
    let userList: [RankData]?
}

// MARK: - UserList
struct RankData: Codable {
    let userName: String?
    let profileImageURL: String?
    let part: String?
    let postCount: Int?
    let rank: String?
}
