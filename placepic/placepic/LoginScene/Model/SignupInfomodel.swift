//
//  SignupInfomodel.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/14.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct SignupInfomodel: Codable {
    let success: Bool
    let status: Int
    let message: String
    let data: [SignupD]
    
    
    enum CodingKeys:String, CodingKey {
        case message = "message"
        case status = "status"
        case data = "data"
        case success = "success"
        
    }
    //
    init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([SignupD].self, forKey: .data)) ?? []
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    }
}


// MARK: - Datum
struct SignupD: Codable {
    let email, password, userName, userBirth: String
    let gender: Int
}
