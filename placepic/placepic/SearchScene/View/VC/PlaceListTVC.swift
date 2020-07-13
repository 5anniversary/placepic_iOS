//
//  PlaceListTVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/02.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Kingfisher

class PlaceListTVC: UITableViewCell {
    static let identifier: String = "PlaceListTVC"
    
    @IBOutlet var placeName: UILabel!
    @IBOutlet var placeSubway: UILabel!
    @IBOutlet var placeDate: UILabel!
    @IBOutlet var placePhoto: UIImageView!
    @IBOutlet var placeWriter: UIImageView!
    @IBOutlet var writerName: UILabel!
    @IBOutlet var placeTag: [UITextField]!
    
    //210
    override func awakeFromNib() {
        super.awakeFromNib()
        placeWriter.layer.cornerRadius = placeWriter.frame.height/2
        for i in 0..<3{
            placeTag[i].layer.borderWidth = 0.0
        }
        placeTag[1].layer.borderWidth = 0.0
//        placeTag[1].borderStyle.
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setPlaceInfo(pName: String, pSubway:String,pDate:String, pPhoto:String, pWriter: String, wName:String, pTag1:String, pTag2:String, pTag3:String) {
        placeName.text = pName
        placeSubway.text = pSubway
        placeDate.text = pDate
        placePhoto.kf.setImage(with: URL(string: pPhoto))
        placeWriter.kf.setImage(with: URL(string: pWriter))
        placePhoto.layer.cornerRadius = 4
        writerName.text = wName
        placeTag[0].text = pTag1
        placeTag[1].text = pTag2
        placeTag[2].text = pTag3
        
    }
}
