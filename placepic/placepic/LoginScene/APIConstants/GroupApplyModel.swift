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
    var success: Bool
    var message: String
    var data: tokendata?
 
    
     enum CodingKeys:String, CodingKey {
            case message = "message"
            case success = "success"
            case data = "data"
            
            }
            
     //
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(tokendata.self, forKey: .data)) ?? nil
    }
}
// MARK: - DataClass
struct tokendata: Codable {
    var accessToken: String
}
