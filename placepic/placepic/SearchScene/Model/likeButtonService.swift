//
//  SignupService.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/05/16.
//  Copyright © 2020 이유진. All rights reserved.
//

import Foundation
import Alamofire

struct likeButtonService {
    static let shared = likeButtonService()

    private func makeParameter(_ placeIdx: Int) -> Parameters {
        return ["placeIdx": placeIdx]
        }

    func like(placeIdx: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json", "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0"]
        let dataRequest = Alamofire.request(placeListAPI.postlikeURL, method: .post, parameters: makeParameter(placeIdx), encoding:
    JSONEncoding.default, headers: header)

            dataRequest.responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    guard let value = dataResponse.result.value else { return }
                    let networkResult = self.judge(by: statusCode, value)
                    completion(networkResult)
                case .failure: completion(.networkFail)
                }
            }
        }
    func delete(placeIdx: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
            let header: HTTPHeaders = ["Content-Type": "application/json", "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0"]
        let likedeleteURL:String = placeListAPI.deletelikeURL + "\(placeIdx)"
        let dataRequest = Alamofire.request(likedeleteURL, method: .delete, parameters: makeParameter(placeIdx), encoding:
    JSONEncoding.default, headers: header)

            dataRequest.responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    guard let value = dataResponse.result.value else { return }
                    let networkResult = self.judge(by: statusCode, value)
                    completion(networkResult)
                case .failure: completion(.networkFail)
                }
            }
        }
        private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
            switch statusCode {
            case 200: return islike(by: data)
            case 400: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }

        private func islike(by data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(LikeData.self, from: data) else { return .pathErr }
            return .success(decodedData.message)
//            guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
//            return .success(tokenData.jwt)
        }
}
