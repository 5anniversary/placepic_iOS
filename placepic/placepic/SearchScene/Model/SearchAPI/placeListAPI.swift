//
//  placeListAPI.swift
//  placepic
//
//  Created by 이유진 on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct placeListAPI {
    static let getplacedURL = GeneralAPI.baseURL + "/places/group/1"
    static let getdetailplace = GeneralAPI.baseURL + "/places/"
    static let postbookmarkURL  = GeneralAPI.baseURL + "/places/bookmark"
    static let deletebookmarkURL = GeneralAPI.baseURL + "/places/bookmark/"
    static let postlikeURL = GeneralAPI.baseURL + "/places/like"
    static let deletelikeURL = GeneralAPI.baseURL + "/places/like/"
    static let likelistURL = GeneralAPI.baseURL + "/places/like/"
    static let deleteplaceURL = GeneralAPI.baseURL + "/places/"
}
