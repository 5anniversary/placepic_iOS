//
//  uploadPhotoCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class InnerUploadPhotoCVC: UICollectionViewCell {
        
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemBackgroundView: UIView!
    @IBOutlet weak var label: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = "0/10"
        label.font = Font.fontSize11
        label.textColor = UIColor.gray70
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
    }
    
}
