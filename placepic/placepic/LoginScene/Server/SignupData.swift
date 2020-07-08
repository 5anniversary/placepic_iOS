//
//  SignupData.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct SignupData: Codable {
    var status: Int
    var success: Bool
    var message: String

    
    enum CodingKeys:String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

