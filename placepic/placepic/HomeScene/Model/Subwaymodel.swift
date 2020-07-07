//
//  Subwaymodel.swift
//  placepic
//
//  Created by elesahich on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

enum SubwayNumber: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case incheonone = 10
    case inchonetwo = 11
    case bundang = 12
    case sinbundang = 13
    case kyungeui = 14
    case kyungchun = 15
    case airport = 16
    case euijungbu = 17
    case suin = 18
    case everline = 19
    case gyunggang = 20
    case yooeee = 21
    case seohae = 22
    case gimpo = 23
}

extension SubwayNumber {
    var image: UIImage{
        switch self {
        case .one:
            return UIImage(named: "icStation1")!
        case .two:
            return UIImage(named: "icStation2")!
        case .three:
            return UIImage(named: "icStation3")!
        case .four:
            return UIImage(named: "icStation4")!
        case .five:
            return UIImage(named: "icStation5")!
        case .six:
            return UIImage(named: "icStation6")!
        case .seven:
            return UIImage(named: "icStation7")!
        case .eight:
            return UIImage(named: "icStation8")!
        case .nine:
            return UIImage(named: "icStation9")!
        case .incheonone:
            return UIImage(named: "icStationIncheon1")!
        case .inchonetwo:
            return UIImage(named: "icStationIncheon2")!
        case .bundang:
            return UIImage(named: "icStationBundang")!
        case .sinbundang:
            return UIImage(named: "icStationSinbundang")!
        case .kyungeui:
            return UIImage(named: "icStationGyeongUijungAng")!
        case .kyungchun:
            return UIImage(named: "icStationGyeongchun")!
        case .airport:
            return UIImage(named: "icStationAirport")!
        case .euijungbu:
            return UIImage(named: "icStationUijeongbu")!
        case .suin:
            return UIImage(named: "icStationSuin")!
        case .everline:
            return UIImage(named: "icStationEverline")!
        case .gyunggang:
            return UIImage(named: "icStationGyeonggang")!
        case .yooeee:
            return UIImage(named: "icStationUisinseol")!
        case .seohae:
            return UIImage(named: "icStationWest")!
        case .gimpo:
            return UIImage(named: "icStationKimpho")!
        }
    }
}
