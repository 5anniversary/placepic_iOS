//
//  EmailService.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/09.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct EmailService {
    static let shared = EmailService()
    private func makeParameter(_ email: String) -> Parameters {
        return ["email": email]
    }
    func emailcheck(email: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.emailcheckURL, method: .post, parameters: makeParameter(email), encoding:
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
        case 200: return isEmail(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isEmail(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(Emailmodel.self, from: data) else { return .pathErr }
        if decodedData.success {
            return .success(data)}
        else {
            return .requestErr(decodedData.message)}
    }
}
