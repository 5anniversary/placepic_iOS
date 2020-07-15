//
//  UploadServices.swift
//  placepic
//
//  Created by elesahich on 2020/07/15.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

struct UploadServices {
    static let uploadServices = UploadServices()
    
    func upload(imageArray: [UIImage],
                title: String,
                adress: String,
                roadAddress: String,
                mapX: Int,
                mapY: Int,
                placeReview: String,
                categoryIndex: Int,
                groupIdx: Int,
                tags: [Int],
                infotags: [Int],
                subwayIdx: [Int],
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let parameters = [
            "image": imageArray,
            "title": title,
            "address": adress,
            "roadAddress": roadAddress,
            "mapx": mapX,
            "mapy": mapY,
            "placeReview": placeReview,
            "categoryIdx": categoryIndex,
            "groupIdx": groupIdx,
            "tags": tags,
            "infoTags": infotags,
            "subwayIdx": subwayIdx
            ] as [String : Any]
        
        let header: HTTPHeaders = [
            "Content-Type": "multipart/form-data",
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0"
        ]
        let url = HomeAPIs.uploadURL
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            /// `param에 imageArray 분리 해야 하는지?`
            /// 아님 그냥 아래처럼 쓰면 되는지?
            
//            for image in imageArray {
//                if let imageData = image.jpegData(compressionQuality: 0.3) {
//                    print(imageData)
//                    multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
//                }
//            }
            
            for (key, value) in parameters {
                if value as! [UIImage] == imageArray {
                    for image in imageArray {
                        if let imageData = image.jpegData(compressionQuality: 0.3) {
                            multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
                        }
                    }
                } else {
                    multipartFormData.append("\(value)".data(using: .utf8, allowLossyConversion: false)!, withName: "\(key)")
                }
            }
        }, to: url, method: .post, headers: header) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    completion(.success(response.result.value as Any))
                    
                }
            case .failure(_):
                print(EncodingError.Context.self)
            }
        }
    }
}

func uploadArticle(pictures: [UIImage], completion: @escaping (NetworkResult<Any>) -> Void) {
    
    let url = HomeAPIs.uploadURL
    let header: HTTPHeaders = [
        "Content-Type": "multipart/form-data",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0",
    ]
    
    Alamofire.upload(multipartFormData: { multipartFormData in
        for image in pictures {
            if let imageData = image.jpegData(compressionQuality: 0.3) {
                print(imageData)
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
            }
        }
    }, to: url, method: .post, headers: header) { encodingResult in
        
        switch encodingResult {
        case .success(let upload, _, _):
            upload.responseJSON { response in
                completion(.success(response.result.value as Any))
                
            }
        case .failure(_):
            print(EncodingError.Context.self)
        }
    }
}
