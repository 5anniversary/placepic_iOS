//
//  likeListModel.swift
//  placepic
//
//  Created by 이유진 on 2020/07/17.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - likeListModel
struct likeListModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [likepeopleModel]
}

// MARK: - Datum
struct likepeopleModel: Codable {
    let userName: String
    let profileImageURL: String
    let likeCreatedAt: Int
    let part: String

    enum CodingKeys: String, CodingKey {
        case userName
        case profileImageURL = "profileImageUrl"
        case likeCreatedAt, part
    }
}
