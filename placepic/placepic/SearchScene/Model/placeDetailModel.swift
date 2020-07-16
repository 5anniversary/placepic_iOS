
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
    let placeRoadAddress: String
    let isLiked, isBookmarked: Bool
    let likeCount, bookmarkCount: Int
    let subway: [String]
    let imageURL: [String]
    let keyword, placeInfo: [String]
    let uploader: Uploader
    let mobileNaverMapLink: String
    let likeList: [LikeList]

    enum CodingKeys: String, CodingKey {
        case categoryIdx, placeName, placeReview, placeCreatedAt, placeRoadAddress, isLiked, isBookmarked, likeCount, bookmarkCount, subway
        case imageURL = "imageUrl"
        case keyword, placeInfo, uploader, mobileNaverMapLink, likeList
    }
}

// MARK: - LikeList
struct LikeList: Codable {
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

// MARK: - Uploader
struct Uploader: Codable {
    let userName: String
    let profileImageURL: String
    let part: String
    let postCount: Int
    let deleteBtn: Bool

    enum CodingKeys: String, CodingKey {
        case userName
        case profileImageURL = "profileImageUrl"
        case part, postCount, deleteBtn
    }
}
