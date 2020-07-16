//
//import Foundation
//
//// MARK: - Welcome
////struct placeListModel: Codable {
////    let status: Int
////    let success: Bool
////    let message: String
////    let data: [placeData]
////}
////
////// MARK: - Datum
////struct placeData: Codable {
////    let placeIdx: Int
////    let placeName, placeAddress, placeRoadAddress: String
////    let placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt: Int
////    let placeReview: String
////    let category: Category
////    let groupIdx, placeViews: Int
////    let tag: [Tag]
////    let subway: [Subway]
////    let user: User
////    let imageURL: [String]
////
////    enum CodingKeys: String, CodingKey {
////        case placeIdx, placeName, placeAddress, placeRoadAddress, placeMapX, placeMapY, placeCreatedAt, placeUpdatedAt, placeReview, category, groupIdx, placeViews, tag, subway, user
////        case imageURL = "imageUrl"
////    }
////}
////
////// MARK: - Category
////struct Category: Codable {
////    let categoryIdx: Int
////    let categoryName: String
////}
////
////// MARK: - Subway
////struct Subway: Codable {
////    let subwayIdx: Int
////    let subwayName: String
////    let subwayLine: [Int]
////}
////
////// MARK: - Tag
////struct Tag: Codable {
////    let tagIdx: Int
////    let tagName: String
////    let tagIsBasic, categoryIdx: Int
////}
////
////// MARK: - User
////struct User: Codable {
////    let userIdx: Int
////    let userName, email, profileURL: String
////}
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Welcome
//struct placeListModel: Codable {
//    let status: Int
//    let success: Bool
//    let message: String
//    let data: placeListClass
//}
//
//// MARK: - DataClass
//struct placeListClass: Codable {
//    let result: [placeData]
//    let count: Int
//}
//
//// MARK: - Result
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
//    let categoryName: CategoryName
//    let keyword, feature: [Tag]
//}
//
//enum CategoryName: String, Codable {
//    case 기타 = "기타"
//    case 맛집 = "맛집"
//    case 스터디 = "스터디"
//    case 카페 = "카페"
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let tagIdx: Int
//    let tagName: String
//    let tagIsBasic, categoryIdx: Int
//}
//
//// MARK: - Subway
//struct Subway: Codable {
//    let subwayIdx: Int
//    let subwayName: String
//    let subwayLine: [Int]
//}
//
//// MARK: - User
//struct User: Codable {
//    let userIdx: Int
//    let userName, email: String
//    let profileURL: String
//}
//

import Foundation

// MARK: - Welcome
struct placeListModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: placeListClass
}

// MARK: - DataClass
struct placeListClass: Codable {
    let result: [placeData]
    let count: Int
}

// MARK: - placeData
struct placeData: Codable {
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
    let categoryName: CategoryName
    let keyword, feature: [Tag]
}

enum CategoryName: String, Codable {
    case 기타 = "기타"
    case 맛집 = "맛집"
    case 스터디 = "스터디"
    case 카페 = "카페"
}

// MARK: - Tag
struct Tag: Codable {
    let tagIdx: Int
    let tagName: String
    let tagIsBasic, categoryIdx: Int
}

// MARK: - Subway
struct Subway: Codable {
    let subwayIdx: Int
    let subwayName: String
    let subwayLine: [Int]
}

// MARK: - User
struct User: Codable {
    let userIdx: Int
    let userName, email: String
    let profileURL: String
}

