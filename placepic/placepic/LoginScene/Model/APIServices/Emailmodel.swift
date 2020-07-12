//
//  Email.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/09.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Emailmodel: Codable {
    let message: String
    let status: Int
    let success: Bool
    let data: Emailver?
    
    enum CodingKeys:String, CodingKey {
        case message = "message"
        case status = "status"
        case success = "success"
        case data = "data"
        
            
            }
            
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        data = (try? values.decode(Emailver.self, forKey: .data)) ?? nil
        message = (try? values.decode(String.self, forKey: . message)) ?? ""
}

// MARK: - DataClass
struct Emailver: Codable {
    let email: String
}
}
