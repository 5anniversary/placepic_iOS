//
//  NearstationCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/05.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class NearstationCVC: UICollectionViewCell {
    @IBOutlet weak var stationLabel: UILabel!
    
    var model: StationModel? {
        didSet {
            stationLabel.text = model?.station
        }
    }
    
    /// X button 말고 Cell이 눌리면 없앨거에요
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
