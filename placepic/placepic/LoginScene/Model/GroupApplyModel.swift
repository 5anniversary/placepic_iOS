//
//  GroupApplyModel.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/16.
//  Copyright © 2020 elesahich. All rights reserved.
//


import Foundation

// MARK: - Welcome
struct GroupApplyModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Groupdata?
    
    enum CodingKeys:String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
//        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
//        message = (try? values.decode(String.self, forKey: . message)) ?? ""
//        data = (try? values.decode(Groupdata.self, forKey: .data)) ?? nil
//
//    }
}

// MARK: - DataClass
struct Groupdata: Codable {
    let groupName: String
    let groupImage: String
}
