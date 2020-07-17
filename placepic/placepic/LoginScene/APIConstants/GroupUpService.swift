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
    
//    let groupIdx2 = UserDefaults.standard.integer(forKey: "groupIdx")
    private func makeParameter(_ part: String, _ phonenumber: String, _ groupIdx: Int) -> Parameters{
        
        return ["part": part,
                "phoneNumber": phonenumber,
                "groupIdx": groupIdx
        ]
    }//Request Body에 들어갈 parameter 생성
    
    func signup(part: String, phoneNumber: String, groupIdx: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
         guard let test = UserDefaults.standard.string(forKey: "token") else { return }
        let header: HTTPHeaders = ["Content-Type": "application/json", "token":test] //Request Header 생성
        let dataRequest = Alamofire.request(APIConstants.applygroupURL , method: .post, parameters: makeParameter(part, phoneNumber, groupIdx), encoding: JSONEncoding.default, headers: header)
        
        //데이터 통신 시작

        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}

                guard let data = dataResponse.result.value else {return}
                
                let networkResult = self.judge(by: statusCode,data)
                completion(networkResult)
              
    
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode: Int,_ data:Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isSignup(by: data)
        case 400: return .requestErr(data)
        case 404: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isSignup(by data:Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GroupApplyModel.self, from: data) else {return .pathErr}
        
        if decodedData.success
            {
                return .success(data)}
        else
            {
           
                return .requestErr(decodedData.message)}
    }
    
    
}

//
//import Foundation
//
//import Alamofire
//
//struct GroupUpService {
//    let waitinggroups = UserDefaults.standard.integer(forKey: "groupIdx")
//
//    static let shared = GroupUpService()
//    private func makeParameter(_ part: String, _ phonenumber: String) -> Parameters {
//        return ["part": part, "phonenumber": phonenumber]
//    }
//    func groupup(part: String, phonenumber: String, groupIdx : Int, completion: @escaping (NetworkResult<Any>) -> Void) {
//        guard let test = UserDefaults.standard.string(forKey: "token") else { return }
//        let header: HTTPHeaders = ["Content-Type": "application/json", "token":test] //Request Header 생성
//        print("qqkjsalkfgjadoshgalihadgASDG")
//        print(groupIdx)
//        let dataRequest = Alamofire.request(APIConstants.applygroupURL + String(describing: groupIdx), method: .post, parameters: makeParameter(part, phonenumber), encoding:
//            JSONEncoding.default, headers: header)
//        dataRequest.responseData { dataResponse in
//            switch dataResponse.result {
//            case .success:
//                guard let statusCode = dataResponse.response?.statusCode else { return }
//                guard let value = dataResponse.result.value else { return }
//                let networkResult = self.judge(by: statusCode, value)
//                completion(networkResult)
//            case .failure: completion(.networkFail)
//            }
//        }
//    }
//    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
//        switch statusCode {
//        case 200: return isSignup(by: data)
//        case 400: return .pathErr
//        case 500: return .serverErr
//        default: return .networkFail
//        }
//    }
//
//    private func isSignup(by data:Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(GroupApplyModel.self, from: data) else {return .pathErr}
//
//        if decodedData.success
//            {
//                return .success(data)}
//        else
//            {
//
//                return .requestErr(decodedData.message)}
//    }
//
//
//}
