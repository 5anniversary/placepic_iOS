//
//  placeListModel.swift
//  placepic
//
//  Created by 이유진 on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - placeListModel
struct placeListModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [placeData]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([placeData].self, forKey: .data)) ?? []
    }
    
}

// MARK: - placeData
struct placeData: Codable {
    var placeIdx: Int
    var placeName, placeAddress, placeRoadAddress: String
    var placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt: Int
    var placeReview: String
    var category: Category
    var groupIdx, placeViews: Int
    var tag: [Tag]
    var subway: [Subway]
    var user: User
    var imageURL: [String]

    enum CodingKeys: String, CodingKey {
        case placeIdx, placeName, placeAddress, placeRoadAddress, placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt, placeReview, category, groupIdx, placeViews, tag, subway, user
        case imageURL = "imageUrl"
    }
}

// MARK: - Category
struct Category: Codable {
    var categoryIdx: Int
    var categoryName: String
}

// MARK: - Subway
struct Subway: Codable {
    var subwayIdx, subwayLine: Int
    var subwayName: String
}

// MARK: - Tag
struct Tag: Codable {
    var tagIdx: Int
    var tagName: String
    var tagIsBasic, categoryIdx: Int
}

// MARK: - User
struct User: Codable {
    var userIdx: Int
    var userName, email, profileURL: String
}


