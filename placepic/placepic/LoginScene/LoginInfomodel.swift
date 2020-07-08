//
//  LoginInfomodel.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//
// 실패 500

import Foundation

// MARK: - Welcome
struct LoginInfomodel: Codable {
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let accessToken: String
}

