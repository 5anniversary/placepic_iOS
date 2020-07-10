//
//  HomeReviewCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HomeReviewCVC: UICollectionViewCell {
    
    @IBOutlet weak var reviewTextfield: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setReviewTextField()
    }
    
    private func setReviewTextField() {
        reviewTextfield.layer.cornerRadius = 5
        reviewTextfield.backgroundColor = UIColor.gray10
    }
}
