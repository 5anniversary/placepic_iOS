//
//  SigninInfomodel.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//
// 실패 500



import Foundation

// MARK: - Welcome
struct SignupInfomodel: Codable {
    let success: Bool
    let statusCode: Int
    let message: String
    let data: [SignupD]

    
    enum CodingKeys:String, CodingKey {
            case message = "message"
            case statusCode = "statusCode"
            case data = "data"
            case success = "success"
        
        }
        
 //
init (from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            statusCode = (try? values.decode(Int.self, forKey: .statusCode)) ?? -1
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

    
    

