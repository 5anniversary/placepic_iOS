//
//  showStationTVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/06.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class ShowStationTVC: UITableViewCell {
    
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet var subwayImage: [UIImageView]!
    
    /// 자 고민을 해보자
    /// 1 Width는 유동적이고 (문제 - 사진 사이즈에 대해서 유동적이여야 함)
    /// 2 그렇다고 Width를 안잡자니 이상하고
    /// 바라건데 제일 작게 잡고 늘어나는것이 베스트
    /// 해결
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        stationLabel.font = Font.fontSize14
        stationLabel.textColor = UIColor.gray70
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        subwayImage.forEach({
            $0.isHidden = false
        })
    }
    
    /// 2
    var model: SubwayData? {
        /// model의 Count 따라서 분기
        didSet {
            guard let count = model?.subwayLine?.count else {
                return
            }
            stationLabel.text = model?.subwayName
            
            switch count {
            case 4:
                // $0 : Index $1 : element
                subwayImage.enumerated().forEach {
                    guard let lineNum = model?.subwayLine?[$0],
                        let lineImg = SubwayNumber(rawValue: lineNum)?.image else {
                            return
                    }
                    $1.image = lineImg
                }
            case 3:
                // $0 : Index $1 : element
                subwayImage[3].isHidden = true
                subwayImage.enumerated().forEach {
                    if $0 < 3 {
                        guard let lineNum = model?.subwayLine?[$0],
                            let lineImg = SubwayNumber(rawValue: lineNum)?.image else {
                                return
                        }
                        $1.image = lineImg
                    }
                }
            case 2:
                subwayImage[2].isHidden = true
                subwayImage[3].isHidden = true
                subwayImage.enumerated().forEach {
                    // $0 : Index $1 : element
                    
                    if $0 < 2 {
                        guard let lineNum = model?.subwayLine?[$0],
                            let lineImg = SubwayNumber(rawValue: lineNum)?.image else {
                                return
                        }
                        $1.image = lineImg
                    }
                }
            case 1:
                
                subwayImage[1].isHidden = true
                subwayImage[2].isHidden = true
                subwayImage[3].isHidden = true
                subwayImage.enumerated().forEach {
                    // $0 : Index $1 : element
                    if $0 < 1 {
                        guard let lineNum = model?.subwayLine?[$0],
                            let lineImg = SubwayNumber(rawValue: lineNum)?.image else {
                                return
                        }
                        if $0 < 1 {
                            $1.image = lineImg
                        }
                    }
                }
            default:
                assert(false)
            }
        }
    }
}


