//
//  GroupUpService.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/11.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

import Alamofire

struct GroupUpService {
    static let shared = GroupUpService()
    private func makeParameter(_ part: String, _ phonenumber: String, _ groupIdx : Int ) -> Parameters {
        return ["part": part, "phonenumber": phonenumber]
    }
    func groupup(part: String, phonenumber: String, groupIdx : Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json", "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjg5LCJuYW1lIjoi7ZmN7KSA7Je9IiwiaWF0IjoxNTk0NjE4NDkzLCJleHAiOjE1OTcyMTA0OTMsImlzcyI6InBsYWNlcGljIn0.p78Y5CFlUYNN-YFf4K5CT_sIilmVqNkazUMcn0mu2eU"]
        let dataRequest = Alamofire.request(APIConstants.applygrouplistURL + String(groupIdx), method: .post, parameters: makeParameter(part, phonenumber, groupIdx), encoding:
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
        guard let decodedData = try? decoder.decode(GroupApplyModel.self, from: data) else { return .pathErr }
        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
        return .success(tokenData.accessToken)
    }
}
