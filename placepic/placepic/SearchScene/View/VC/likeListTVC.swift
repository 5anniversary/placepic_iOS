//
//  likeListTVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/17.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class likeListTVC: UITableViewCell {
    static let identifier: String = "likeListTVC"

    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var Namelabel: UILabel!
    @IBOutlet weak var Partlabel: UILabel!
    @IBOutlet weak var Datelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setListInfo(likeImg:String, likeName: String, likePart: String, likeDate: Int) {
        ProfileImg.kf.setImage(with: URL(string: likeImg))
//        placeWriter.layer.cornerRadius = placeWriter.frame.height/2
        ProfileImg.layer.cornerRadius = ProfileImg.frame.height/2
        Namelabel.text = likeName
        Partlabel.text = likePart
        let date:Date = Date(timeIntervalSince1970: TimeInterval(likeDate))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        Datelabel.text = dateFormatter.string(from: date)
        
    }
}
