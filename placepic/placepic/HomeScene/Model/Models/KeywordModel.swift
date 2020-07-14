//
//  KeywordModel.swift
//  placepic
//
//  Created by elesahich on 2020/07/05.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

// MARK: - KeywordModel
struct KeywordModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [KeywordData]
}

struct KeywordData: Codable {
    let tagIdx: Int?
    let tagName: String?
    let tagIsBasic: Int?
    let categoryIdx: Int?
}

