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
    
    func getPlaces(_ keyword: String, _ subway: String, completion: @escaping (placeListClass?)-> Void) {
        
        let url = placeListAPI.getplacedURL
        let header: HTTPHeaders = [
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0",
            "Content-Type": "application/json"
        ]
        
        let parameters: Parameters = [
            "tagIdx": keyword,
            "subwayIdx": subway
        ]
        
        if keyword == "" && subway == "" {
            Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: header).responseJSON { response in
                print(response.request)
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(TempResponseResult<placeListClass>.self, from: data)
                        print("object: \(object)")
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
        
        if subway == "" {
            let keywordParam: Parameters = [
                "tagIdx": keyword,
            ]
            Alamofire.request(url, method: .get, parameters: keywordParam, encoding: URLEncoding.queryString, headers: header).responseJSON { response in
                print(response.request)
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(TempResponseResult<placeListClass>.self, from: data)
                        print("object: \(object)")
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
        if keyword == "" {
            let subwayParam: Parameters = [
                "subwayIdx": subway
            ]
            Alamofire.request(url, method: .get, parameters: subwayParam, encoding: URLEncoding.queryString, headers: header).responseJSON { response in
                print(response.request)
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(TempResponseResult<placeListClass>.self, from: data)
                        print("object: \(object)")
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
        if keyword != "" && subway != "" {
            Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: header).responseJSON { response in
                print(response.request)
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(TempResponseResult<placeListClass>.self, from: data)
                        print("object: \(object)")
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
}

//    func getPlaces(_ queryurl: String,completion: @escaping (NetworkResult<Any>) -> Void) {
//        print(#function)
//        let url = placeListAPI.getplacedURL + queryurl
//        let header: HTTPHeaders = [
//            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0",
//            "Content-Type": "application/json"
//        ]
//
//
//        Alamofire.request(url, method: .get, parameters: .none, encoding: JSONEncoding.default, headers: header).responseJSON { response in
//
//            switch response.result {
//            case .success:
//
//                guard let data = response.data else { return }
//                do {
//                    let decoder = JSONDecoder()
//                    let object = try decoder.decode(TempResponseResult<DataClass>.self, from: data)
//                    if object.success {
//                        completion(object.data)
//
//                    } else {
//                        completion(nil)
//                    }
//                } catch (let err) {
//                    print(err.localizedDescription)
//                }
//
//            case .failure:
//                completion(nil)
//            }
//
//
//
//        }
//}
//        let dataRequest = Alamofire.request(url, method: .get, encoding:JSONEncoding.default, headers: header)
//
//        dataRequest.responseData { dataResponse in
//            switch dataResponse.result {
//            case .success:
//                guard let statusCode = dataResponse.response?.statusCode else { return }
//                print(statusCode)
//                guard let value = dataResponse.result.value else { return }
//                let networkResult = self.judge(by: statusCode, value)
//                completion(networkResult)
//            case .failure:
//                completion(.networkFail)
//            }
//        }
//    }
//    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
//        switch statusCode {
//        case 200:
//            print("judge 200")
//            return isPlace(by: data)
//        case 400: return .pathErr
//        case 500: return .serverErr
//        default: return .networkFail
//        }
//    }
//
//    private func isPlace(by data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//
//        guard let decodedData = try? decoder.decode(placeListModel.self, from: data) else { return .pathErr }
//        guard let placeData: placeListClass = decodedData.data else { return .requestErr(decodedData.message) }
//
//        return .success(placeData)
//    }

