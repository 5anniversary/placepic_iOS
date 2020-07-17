//
//  HomeReviewCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HomeReviewCVC: UICollectionViewCell {
    
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var reviewTitleLabel: UILabel!
    var editingflag: Bool = false // false: Empty
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setReviewTextField()
    }
    
    private func setReviewTextField() {
        
        reviewTitleLabel.font = Font.boldFontSize15
        reviewTitleLabel.textColor = UIColor.gray90

        reviewTextView.delegate = self
        reviewTextView.layer.cornerRadius = 5
        reviewTextView.backgroundColor = UIColor.gray10
    }
}

extension HomeReviewCVC: UITextViewDelegate {
        	
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        reviewTextView.resignFirstResponder()
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(#function)
        if reviewTextView.text.isEmpty == true {
            editingflag = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                NotificationCenter.default.post(name: .homeWriteTextViewisEditingNotification, object: nil, userInfo: ["editingflag" : self.editingflag])
            })
        } else {
            editingflag = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                NotificationCenter.default.post(name: .homeWriteTextViewisEditingNotification, object: nil, userInfo: ["editingflag" : self.editingflag])
            })
        }
    }
}

