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
    let isLiked, isBookmarked: String
    let likeCount, bookmarkCount: Int
    let subway: [String]
    let imageURL: [String]
    let keyword, placeInfo: [String]
    let uploader: Uploader
    let likeList: [Uploader]

    enum CodingKeys: String, CodingKey {
        case categoryIdx, placeName, placeReview, placeCreatedAt, isLiked, isBookmarked, likeCount, bookmarkCount, subway
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
