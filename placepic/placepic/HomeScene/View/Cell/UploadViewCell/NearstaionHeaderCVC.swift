//
//  NearstaionHeaderCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class NearstaionHeaderCVC: UICollectionReusableView {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var classifyBadge: UITextField!

    var headerTitle: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    func setupViews() {
        
        mainLabel.font = Font.boldFontSize20
        mainLabel.textColor = UIColor.gray90
        
        classifyBadge.clipsToBounds = true
        classifyBadge.textAlignment = .center
        classifyBadge.text = ""
        classifyBadge.backgroundColor = UIColor.gray20
        classifyBadge.layer.cornerRadius = 5
        classifyBadge.layer.borderWidth = 1
        classifyBadge.layer.borderColor = UIColor.white.cgColor
        
        classifyBadge.font = Font.fontSize13
        
        classifyBadge.textColor = UIColor.gray90
        classifyBadge.isEnabled = false
    }
}
