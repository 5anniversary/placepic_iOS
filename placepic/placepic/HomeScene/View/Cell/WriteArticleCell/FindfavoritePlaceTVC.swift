//
//  FindfavoritePlaceTVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/12.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FindfavoritePlaceTVC: UITableViewCell {
    
    @IBOutlet weak var regiesteredBadgeView: UIView!
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var placeLoactionLabel: UILabel!
    @IBOutlet weak var registeredBadgeLabel: UILabel!
        
    var model: PlaceSearchData? {
        didSet {
            placeTitleLabel.text = model?.placeName
            placeLoactionLabel.text = model?.placeAddress
            regiesteredBadgeView.alpha = (model?.alreadyIn)! ? 1 : 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        regiesteredBadgeView.layer.cornerRadius = 5
        placeTitleLabel.font = .boldSystemFont(ofSize: 15)
        placeTitleLabel.textColor = UIColor.gray90
        placeLoactionLabel.font = .systemFont(ofSize: 13)
        placeLoactionLabel.textColor = UIColor.gray40
        registeredBadgeLabel.font = .boldSystemFont(ofSize: 10)
        registeredBadgeLabel.textColor = UIColor.blueGray40
    }
}
