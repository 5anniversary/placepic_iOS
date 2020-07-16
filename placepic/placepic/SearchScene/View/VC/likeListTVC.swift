//
//  likeListTVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/15.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Kingfisher

class likeListTVC: UITableViewCell {
    static let identifier: String = "likeListTVC"

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var listPart: UILabel!
    @IBOutlet weak var listDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLikeList(lname: String, lpart:String, ldate:String, limg:String) {
        listName.text = lname
        profileImg.kf.setImage(with: URL(string: limg))
        listPart.text = lpart
        listDate.text = ldate
    }

}
