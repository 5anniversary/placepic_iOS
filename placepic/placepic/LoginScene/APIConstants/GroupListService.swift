//
//  GroupListService.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/10.
//  Copyright © 2020 elesahich. All rights reserved.

//
import Foundation
import Alamofire

struct GroupListService {
    static let shared = GroupListService()
    
    func grouplist (completion: @escaping (NetworkResult<Any>) -> Void) {
    
        guard let test = UserDefaults.standard.string(forKey: "token") else { return }
        let header: HTTPHeaders = ["Content-Type": "application/json", "token":test] //Request Header 생성
        
        let detaRequest = Alamofire.request(APIConstants.mygrouplistURL, method: .get, encoding: JSONEncoding.default, headers: header)
        detaRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                print("111")
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                print("111")
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
    print("제발.")
        guard let decodedData = try? decoder.decode(GroupListmodel.self, from: data) else { return .pathErr }
        guard let GroupListmodel: [groupData] = decodedData.data else { return .requestErr(decodedData.message) }
        print(GroupListmodel)
        print("dskdddddj")
        return .success(GroupListmodel)
    }
    
    
}


