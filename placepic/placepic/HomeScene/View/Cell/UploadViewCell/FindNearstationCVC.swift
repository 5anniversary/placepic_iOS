//
//  FindNearstationCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FindNearstationCVC: UICollectionViewCell {
    
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var textFieldArray: [UITextField]!
    @IBOutlet weak var nearStationTitleLabel: UILabel!
    
    var model: SubwayData? {
        didSet {
            textFieldArray.forEach({
                $0.text = model?.subwayName
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTextfield()
        stackView.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textFieldArray.forEach({
            $0.isHidden = false
        })
    }
    
    func dismissVC( ) {
        
    }
    
    private func configureTextfield() {
        nearStationTitleLabel.font = Font.boldFontSize15
        nearStationTitleLabel.textColor = UIColor.gray90
        textFieldArray.forEach({
            $0.font = .systemFont(ofSize: 13)
            $0.layer.cornerRadius = 5
            $0.clipsToBounds = true
            $0.layer.borderColor = UIColor.white.cgColor
            $0.layer.borderWidth = 1
            $0.isUserInteractionEnabled = false
            $0.backgroundColor = UIColor.gray10
        })
    }
}
