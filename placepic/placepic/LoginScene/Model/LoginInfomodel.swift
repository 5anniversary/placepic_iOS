//
//  LoginInfomodel.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/14.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - Welcome

struct LoginInfomodel: Codable {
    var success: Bool
    var message: String
    var data: TokenData?
 
    
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
        data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
    }
}
// MARK: - DataClass
struct TokenData: Codable {
    var accessToken: String
}
