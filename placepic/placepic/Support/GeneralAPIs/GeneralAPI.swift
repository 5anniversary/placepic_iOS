//
//  APIConstants.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "3.34.209.95:3000"
    

    static let adminGetPendingURL = APIConstants.baseURL + "/auth/groups/:groupIdx/myInfo"
    static let adminGrantURL = APIConstants.baseURL + "/groups/:groupIdx/edit"
    static let adminDenyURL = APIConstants.baseURL + "/groups/:groupIdx/delete"
    
    static let getUsefulInformationURL = APIConstants.baseURL + "/tag/:categoryIdx/default"
    static let getCategoryURL = APIConstants.baseURL + "/auth/groups/:groupIdx/apply"
    static let getCategoryKeywordURL = APIConstants.baseURL + "/tag"
    static let getSubwayURL = APIConstants.baseURL + "/subway/"
    
    static let naverSearchURL = APIConstants.baseURL + "/search/place/:groupIdx?query="
    static let groupApplyURL = APIConstants.baseURL + "/auth/groups/:groupIdx/apply"
    static let groupApplyURL = APIConstants.baseURL + "/auth/groups/:groupIdx/apply"
    static let groupApplyURL = APIConstants.baseURL + "/auth/groups/:groupIdx/apply"
    static let groupApplyURL = APIConstants.baseURL + "/auth/groups/:groupIdx/apply"
    static let groupApplyURL = APIConstants.baseURL + "/auth/groups/:groupIdx/apply"
    
}


