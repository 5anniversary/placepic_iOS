//
//  placeService.swift
//  placepic
//
//  Created by 이유진 on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct placeService {
    static let shared = placeService()
    
    func getPlaces(_ queryurl: String,completion: @escaping (NetworkResult<Any>) -> Void) {
        print(#function)
        
        let url = placeListAPI.getplacedURL + queryurl
        let header: HTTPHeaders = [
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0",
            "Content-Type": "application/json"
        ]
        let dataRequest = Alamofire.request(url, method: .get, encoding:JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    guard let value = dataResponse.result.value else { return }
                    let networkResult = self.judge(by: statusCode, value)
                    completion(networkResult)
                case .failure:
                    completion(.networkFail)
                }
            }
        }
        private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
            switch statusCode {
            case 200: return isPlace(by: data)
            case 400: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }

        private func isPlace(by data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(placeListModel.self, from: data) else { return .pathErr }
            guard let placeData: DataClass = decodedData.data else { return .requestErr(decodedData.message) }
            return .success(placeData)
        }
}

