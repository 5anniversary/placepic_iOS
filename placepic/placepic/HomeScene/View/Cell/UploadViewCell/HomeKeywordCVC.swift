//
//  KeywordCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HomeKeywordCVC: UICollectionViewCell {
    
    @IBOutlet weak var keywordTitleLabel: UILabel!
    @IBOutlet weak var keywordStackView: UIStackView!
    @IBOutlet var keywordTextFieldArray: [UITextField]!
            
    /// `1. Modal에서 데이터를 받아서 Keyword나 UsefulInfo에 삽입, reload`
    /// `2. 없던 데이터가 생겼고 CollectionView가 다시 그려질 때`
    /// `       Height가 다시 계산 될 것임`
    /// `3. 새로 생긴 데이터를 cell에다가 주입해줄 것이고`
    /// `       innerCollectionView의 데이터도 변했으므로 늘어나게 된다`
    /// reload 안 해줘도 됨,,,이제,,,근데 사실 리팩토링때도 어떻게 짜야겠다 하는 답은 안나옴
    /// 내생각에는 모델은 다 살리고 이제 TableView를 쓸 것 같다 (AutomaticDemension)
    
    var model: KeywordData? {
        didSet {
            keywordTextFieldArray.forEach({
                $0.text = model?.tagName
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}

extension HomeKeywordCVC {

    private func configureCell() {
        keywordTitleLabel.font = Font.boldFontSize15
        keywordTitleLabel.textColor = UIColor.gray90
        
        keywordTextFieldArray.forEach({
            $0.layer.cornerRadius = 5
            $0.layer.borderColor = UIColor.warmPink.cgColor
            $0.layer.borderWidth = 1
            $0.textColor = UIColor.warmPink
            $0.textAlignment = .center
            $0.font = Font.fontSize13
            $0.isEnabled = false
        })
    }
}
