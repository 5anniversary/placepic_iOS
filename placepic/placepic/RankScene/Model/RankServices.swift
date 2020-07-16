//
//  RankServices.swift
//  placepic
//
//  Created by elesahich on 2020/07/16.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct RankServices {
    
    static let rankServices = RankServices()
    func getRankData(completion: @escaping (RankDataClass?) -> Void) {
        
        let url = RankAPI.rankURL
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0",
        ]
        
        Alamofire.request(url, method: .get, parameters: .none, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(TempResponseResult<RankDataClass>.self, from: data)
                    if object.success {
                        completion(object.data)
                    } else {
                        completion(nil)
                    }
                } catch (let err) {
                    print(err.localizedDescription)
                }
            case .failure:
                completion(nil)
            }
        }
    }
}


