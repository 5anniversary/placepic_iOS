//import Foundation
//
//// MARK: - DetailView
//struct DetailView: Codable {
//    let status: Int
//    let success: Bool
//    let message: String
//    let data: DetailModel?
//}
//
//// MARK: - DetailModel
//struct DetailModel: Codable {
//    let categoryIdx: Int
//    let placeName, placeReview: String
//    let placeCreatedAt: Int
//    let placeRoadAddress, isLiked, isBookmarked: String
//    let likeCount, bookmarkCount: Int
//    let subway: [String]
//    let imageURL: [String]
//    let keyword, placeInfo: [String]
//    let uploader: Uploader
//    let likeList: [Uploader]
//
//    enum CodingKeys: String, CodingKey {
//        case categoryIdx, placeName, placeReview, placeCreatedAt, isLiked, isBookmarked, likeCount, bookmarkCount, subway
//        case imageURL = "imageUrl"
//        case keyword, placeInfo, uploader, likeList
//    }
//}
//
//// MARK: - Uploader
//struct Uploader: Codable {
//    let userName: String
//    let profileImageURL: String?
//    let likeCreatedAt: Int?
//    let part: String
//    let postCount: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case userName
//        case profileImageURL = "profileImageUrl"
//        case likeCreatedAt, part, postCount
//    }
//}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - DetailView
struct DetailView: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DetailModel
}

// MARK: - DetailModel
struct DetailModel: Codable {
    let categoryIdx: Int
    let placeName, placeReview: String
    let placeCreatedAt: Int
    let placeRoadAddress, isLiked, isBookmarked: String
    let likeCount, bookmarkCount: Int
    let subway: [String]
    let imageURL: [String]
    let keyword, placeInfo: [String]
    let uploader: Uploader
    let likeList: [Uploader]

    enum CodingKeys: String, CodingKey {
        case categoryIdx, placeName, placeReview, placeCreatedAt, placeRoadAddress, isLiked, isBookmarked, likeCount, bookmarkCount, subway
        case imageURL = "imageUrl"
        case keyword, placeInfo, uploader, likeList
    }
}

// MARK: - Uploader
struct Uploader: Codable {
    let userName: String
    let profileImageURL: String?
    let likeCreatedAt: Int?
    let part: String
    let postCount: Int?

    enum CodingKeys: String, CodingKey {
        case userName
        case profileImageURL = "profileImageUrl"
        case likeCreatedAt, part, postCount
    }
}
