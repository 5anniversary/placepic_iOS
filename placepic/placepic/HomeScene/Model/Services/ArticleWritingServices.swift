//
//  ArticleWritingServices.swift
//  placepic
//
//  Created by elesahich on 2020/07/12.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

struct ArticleWritingServices {
    
    static let articleWritingServices = ArticleWritingServices()
    
    func uploadArticle(pictures: [UIImage], completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = HomeAPIs.articlewriteURL
        let header: HTTPHeaders = [
            "Content-Type": "multipart/form-data",
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOjMsIm5hbWUiOiLstZzsmIHtm4giLCJpYXQiOjE1OTM2OTkxODMsImV4cCI6MTU5NjI5MTE4MywiaXNzIjoicGxhY2VwaWMifQ.rmFbeBfviyEzbMlMM4b3bMMiRcNDDbiX8bQtwL_cuN0",
        ]
        
        Alamofire.upload(multipartFormData: {
            multipartFormData in
            
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
}

