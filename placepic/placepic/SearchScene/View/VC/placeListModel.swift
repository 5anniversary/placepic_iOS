//
//  placeListModel.swift
//  placepic
//
//  Created by 이유진 on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let placeIdx: Int
    let placeName, placeAddress, placeRoadAddress: String
    let placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt: Int
    let placeReview: String
    let category: Category
    let groupIdx, placeViews: Int
    let tag: [Tag]
    let subway: [Subway]
    let user: User
    let imageURL: [String]

    enum CodingKeys: String, CodingKey {
        case placeIdx, placeName, placeAddress, placeRoadAddress, placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt, placeReview, category, groupIdx, placeViews, tag, subway, user
        case imageURL = "imageUrl"
    }
}

// MARK: - Category
struct Category: Codable {
    let categoryIdx: Int
    let categoryName: String
}

// MARK: - Subway
struct Subway: Codable {
    let subwayIdx, subwayLine: Int
    let subwayName: String
}

// MARK: - Tag
struct Tag: Codable {
    let tagIdx: Int
    let tagName: String
    let tagIsBasic, categoryIdx: Int
}

// MARK: - User
struct User: Codable {
    let userIdx: Int
    let userName, email, profileURL: String
}
