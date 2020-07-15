//
//  UsefulInformationCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class UsefulInformationCVC: UICollectionViewCell {
    
    @IBOutlet weak var usefulTitleLabel: UILabel!
    @IBOutlet weak var usefulStackView: UIStackView!
    @IBOutlet var usefulTextFieldarray: [UITextField]!
    
    var model: UsefulInformData? {
        didSet {
            usefulTextFieldarray.forEach({
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

extension UsefulInformationCVC {
    
    private func configureCell() {
        usefulTitleLabel.font = Font.boldFontSize15
        usefulTitleLabel.textColor = UIColor.gray90
        
        usefulTextFieldarray.forEach({
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
