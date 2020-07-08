//
//  SignupService.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire

struct SignupService {
    static let shared = SignupService()
 
    private func makeParameter(_ email:String,_ password:String, _ userName:String, _ userBirth:String, _ gender:Int) -> Parameters{
        return ["email":email, "password":password, "userName":userName, "userBirth":userBirth, "gender":gender]
    }//Request Body에 들어갈 parameter 생성
    
    func signup(email:String, password: String, userName:String,userBirth:String,gender:Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"] //Request Header 생성
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(email, password, userName, userBirth, gender), encoding: JSONEncoding.default, headers: header)
        
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
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isSignup(by data:Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupData.self, from: data) else {return .pathErr}
        if decodedData.success
            {   print("dflkajdslakfj;jg;")
                return .success(data)}
        else
            {
                print("dflkajg;")
                return .requestErr(decodedData.message)}
    }
    
    
}
