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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    private func configureUI() {
        usefulTitleLabel.font = Font.boldFontSize15
        usefulTitleLabel.textColor = UIColor.gray90
        
    }
}
