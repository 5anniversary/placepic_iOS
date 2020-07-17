//
//  AdminData.swift
//  placepic
//
//  Created by 이유진 on 2020/07/09.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct AdminData: Codable {
    var status: Int
    var success: Bool
    var message: String

    enum CodingKeys: String, CodingKey {
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
