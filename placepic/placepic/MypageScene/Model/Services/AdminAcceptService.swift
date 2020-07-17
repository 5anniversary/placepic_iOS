//
//  AdminAcceptService.swift
//  placepic
//
//  Created by 이유진 on 2020/07/09.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct AdminAcceptService {
    static let shared = AdminAcceptService()

    private func makeParameter(_ userIdx: Int) -> Parameters {
        return ["userIdx": userIdx]
        }

    func delete(userIdx: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
            let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(adminAPI.deletadminURL, method: .delete, parameters: makeParameter(userIdx), encoding:
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
    
    func accept(userIdx: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
            let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(adminAPI.acceptadminURL, method: .put, parameters: makeParameter(userIdx), encoding:
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
            case 200: return isUser(by: data)
            case 400: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }

        private func isUser(by data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(AdminData.self, from: data) else { return .pathErr }
            return .success(decodedData.message)
//            guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
//            return .success(tokenData.jwt)
        }
}
