//
//  NearstationCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/05.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class NearstationCVC: UICollectionViewCell {
    @IBOutlet weak var stationTextField: UITextField!

    var model: SubwayData? {
        didSet {
            stationTextField.text = model?.subwayName
        }
    }
    
    private func configureTextfield() {
        stationTextField.textAlignment = .center
        stationTextField.isEnabled = false
        stationTextField.font = Font.boldFontSize12
        stationTextField.textColor = UIColor.gray70
        stationTextField.layer.cornerRadius = 5
        stationTextField.layer.borderColor = UIColor.white.cgColor
        stationTextField.layer.borderWidth = 1
        stationTextField.isUserInteractionEnabled = false
        stationTextField.backgroundColor = UIColor.gray10
    }
    
    /// X button 말고 Cell이 눌리면 없앨거에요
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureTextfield()
    }
}
