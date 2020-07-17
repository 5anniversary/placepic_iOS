
//import Foundation
//
//// MARK: - DetailView
//struct DetailView: Codable {
//    let status: Int
//    let success: Bool
//    let message: String
//    let data: DetailModel
//}
//
//// MARK: - DataClass
//struct DetailModel: Codable {
//    let categoryIdx: Int
//    let placeName, placeReview: String
//    let placeCreatedAt: Int
//    let placeRoadAddress: String
//    let isLiked, isBookmarked: Bool
//    let likeCount, bookmarkCount: Int
//    let subway: [String]
//    let imageURL: [String]
//    let keyword, placeInfo: [String]
//    let uploader: Uploader
//    let profileImageURL: String
//
//    enum CodingKeys: String, CodingKey {
//        case categoryIdx, placeName, placeReview, placeCreatedAt, placeRoadAddress, isLiked, isBookmarked, likeCount, bookmarkCount, subway
//        case imageURL = "imageUrl"
//        case keyword, placeInfo, uploader
//        case profileImageURL = "profileImageUrl"
//    }
//}
//
//// MARK: - Uploader
//struct Uploader: Codable {
//    let userName: String
//    let profileImageURL: String
//    let part: String
//    let postCount: Int
//    let deleteBtn: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case userName
//        case profileImageURL = "profileImageUrl"
//        case part, postCount, deleteBtn
//    }
//}
import Foundation

// MARK: - DetailModel
struct DetailView: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DetailModel
}

// MARK: - DetailModel
struct DetailModel: Codable {
    var categoryIdx: Int
    var placeName, placeReview: String
    var placeCreatedAt: Int
    var placeRoadAddress: String
    var isLiked, isBookmarked: Bool
    var likeCount, bookmarkCount: Int
    var subway: [String]
    var imageURL: [String]
    var keyword, placeInfo: [String]
    var uploader: Upload
    var mobileNaverMapLink: String

    enum CodingKeys: String, CodingKey {
        case categoryIdx, placeName, placeReview, placeCreatedAt, placeRoadAddress, isLiked, isBookmarked, likeCount, bookmarkCount, subway
        case imageURL = "imageUrl"
        case keyword, placeInfo, uploader, mobileNaverMapLink
    }
}

// MARK: - Uploader
struct Upload: Codable {
    var userName: String
    var profileImageURL: String
    var part: String
    var postCount: Int
    var deleteBtn: Bool

    enum CodingKeys: String, CodingKey {
        case userName
        case profileImageURL = "profileImageUrl"
        case part, postCount, deleteBtn
    }
}
