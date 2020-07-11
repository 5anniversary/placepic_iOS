//
//  StationModel.swift
//  placepic
//
//  Created by elesahich on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - SubwayModel
struct SubwayModel: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let data: [SubwayData]?
}

// MARK: - Datum
struct SubwayData: Codable, Hashable {
    let subwayIdx: Int?
    let subwayName: String?
    let subwayLine: [Int]?
}
