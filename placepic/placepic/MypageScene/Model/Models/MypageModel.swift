//
//  MypageModel.swift
//  placepic
//
//  Created by elesahich on 2020/07/17.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - Empty
struct MypageModel: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let data: MypageData?
}

// MARK: - DataClass
struct MypageData: Codable {
    let userName, part: String?
    let userImage: String?
    let state, postCount: Int?    
}
