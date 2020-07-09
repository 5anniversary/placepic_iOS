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
    @IBOutlet weak var checkmarkLabel: UILabel!
    
    var isInEditingMode: Bool = false {
        didSet {
            checkmarkLabel.isHidden = !isInEditingMode
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isInEditingMode {
                checkmarkLabel.text = isSelected ? "✓" : ""
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
    }
    
}
