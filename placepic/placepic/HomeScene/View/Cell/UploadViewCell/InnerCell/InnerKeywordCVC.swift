//
//  InnerKeywordCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/14.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class InnerKeywordCVC: UICollectionViewCell {
    
    @IBOutlet weak var keywordLabel: UILabel?
    
    var model: KeywordData? {
        didSet {
            keywordLabel?.text = model?.tagName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
}
