//
//  Notification.swift
//  placepic
//
//  Created by elesahich on 2020/07/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

extension Notification.Name {
    /// 다 뜯어고쳐야됨 KVO나 Closure로 뜯어고치자
    
    static let homeSendmodelNotification = Notification.Name("homeSendmodelNotification")
    static let homeModalKeywordNotification = Notification.Name("homeModalKeywordNotification")
    static let homeModalUsefulNotification = Notification.Name("homeModalUsefulNotification")
    static let homeWriteTextViewisEditingNotification = Notification.Name("homeWriteTextViewisEditingNotification")
    static let homeSendPhotoNotification = Notification.Name("homeSendPhotoNotification")
    static let searchKeywordNotification = Notification.Name("searchKeywordNotification")
    static let searchUsefulNotification = Notification.Name("searchUsefulNotification")
    static let searchSubwayNotification = Notification.Name("searchSubwayNotification")



}
