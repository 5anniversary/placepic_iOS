//
//  SubwayTVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/04.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SubwayTVC: UITableViewCell {

    static let identifier: String = "SubwayTVC"
    
    @IBOutlet var subwayName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
