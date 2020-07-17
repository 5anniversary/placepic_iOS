//
//  HomeAPIs.swift
//  placepic
//
//  Created by elesahich on 2020/07/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct HomeAPIs {
    /// /tag/:index
    /// index: 1. 맛집 2. 술집 3. 카페 4. 스터디 5. 기타
    
    // Get
    static let keywordURL = GeneralAPI.baseURL + "/tag/" // + index
    static let usefulInformURL = GeneralAPI.baseURL + "/tag/default/" // + index
    static let nearstationURL = GeneralAPI.baseURL + "/subway/"
    static let placeSearchURL = GeneralAPI.baseURL + "/search/place/" // +쿼리스트링 : 1?query=
    
    // Post
    static let uploadURL = GeneralAPI.baseURL + "/places"
    
}
