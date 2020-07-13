//
//  placeListModel.swift
//  placepic
//
//  Created by 이유진 on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//
//import Foundation
//
//// MARK: - Welcome
//struct placeListModel: Codable {
//    let status: Int
//    let success: Bool
//    let message: String
//    let data: [placeData]
//}
//
//// MARK: - Datum
//struct placeData: Codable {
//    let placeIdx: Int
//    let placeName, placeAddress, placeRoadAddress: String
//    let placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt: Int
//    let placeReview: String
//    let category: Category
//    let groupIdx, placeViews: Int
//    let tag: [Tag]
//    let subway: [Subway]
//    let user: User
//    let imageURL: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case placeIdx, placeName, placeAddress, placeRoadAddress, placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt, placeReview, category, groupIdx, placeViews, tag, subway, user
//        case imageURL = "imageUrl"
//    }
//}
//
//// MARK: - Category
//struct Category: Codable {
//    let categoryIdx: Int
//    let categoryName: String
//}
//
//// MARK: - Subway
//struct Subway: Codable {
//    let subwayIdx: Int
//    let subwayName: String
//    let subwayLine: [Int]
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let tagIdx: Int
//    let tagName: String
//    let tagIsBasic, categoryIdx: Int
//}
//
//// MARK: - User
//struct User: Codable {
//    let userIdx: Int
//    let userName, email, profileURL: String
//}

//******

import Foundation

// MARK: - placeListModel
struct placeListModel: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    var result: [placeData]
    var count: Int
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
    var subwayIdx: Int
    var subwayName: String
    var subwayLine: [Int]
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
    var userName: String
    var email: String
    var profileURL: String
}
