//
//  GroupPartiVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/11.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct GroupPartiService {
    
    static let shared = GroupPartiService()
    
    func grouplist (completion: @escaping (NetworkResult<Any>) -> Void) {
            print("dfsdfsfsdfsdf")
        let header: HTTPHeaders = ["Content-Type": "application/json", "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjg5LCJuYW1lIjoi7ZmN7KSA7Je9IiwiaWF0IjoxNTk0NjE4NDkzLCJleHAiOjE1OTcyMTA0OTMsImlzcyI6InBsYWNlcGljIn0.p78Y5CFlUYNN-YFf4K5CT_sIilmVqNkazUMcn0mu2eU"] //Request Header 생성
        let detaRequest = Alamofire.request(APIConstants.applygrouplistURL, method: .get, encoding: JSONEncoding.default, headers: header)
        detaRequest.responseData { dataResponse in
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
    
    private func judge(by statusCode: Int,_ data:Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isGrouplist(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
   private func isGrouplist(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        print("dfsdfsfsㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗdfsdf")
        guard let decodedData = try? decoder.decode(GroupListmodel.self, from: data) else {return .pathErr }
        print("dfsdfsfsㅗㅗㅗㅗㅗ;;;;;;;;;;ㅗdfsdf")
        guard let GroupListmodel: [groupData] = decodedData.data else { return .requestErr(decodedData.message) }
        print(GroupListmodel)
        return .success(GroupListmodel)
    }
    
    
}


