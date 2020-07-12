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
    
    var model: PlaceSearchData? {
        didSet {
            placeTitleLabel.text = model?.placeName
            placeLoactionLabel.text = model?.placeAddress
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        regiesteredBadgeView.layer.cornerRadius = 5
    }
}
