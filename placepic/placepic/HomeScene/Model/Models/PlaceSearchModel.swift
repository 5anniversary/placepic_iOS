//
//  FindFavoriteModel.swift
//  placepic
//
//  Created by elesahich on 2020/07/12.
//  Copyright © 2020 elesahich. All rights reserved.
//
import Foundation

// MARK: - Empty
struct PlaceSearchModel: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let result: [PlaceSearchData]?
    let count: Int?
}

// MARK: - Result
struct PlaceSearchData: Codable {
    let placeName, placeAddress, placeRoadAddress, placeMapX: String?
    let placeMapY: String?
    let link: String?
    let mobileNaverMapLink: String?
    let alreadyIn: Bool?
}

