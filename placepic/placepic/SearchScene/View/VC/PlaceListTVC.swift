//
//  PlaceListTVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/02.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class PlaceListTVC: UITableViewCell {
    static let identifier: String = "PlaceListTVC"
    
    @IBOutlet var placeName: UILabel!
    @IBOutlet var placeSubway: UILabel!
    @IBOutlet var placePhoto: UIImageView!
    @IBOutlet var placeWriter: UIImageView!
    @IBOutlet var writerName: UILabel!
    @IBOutlet var placeTag: [UITextField]!
    
    //210
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setPlaceInfo(pName: String, pSubway:String, pPhoto:String, pWriter: String, wName:String, pTag1:String, pTag2:String, pTag3:String) {
        placeName.text = pName
        placeSubway.text = pSubway
//        placePhoto.image = UIImage(named: pPhoto)
//        placeWriter.image = UIImage(named: pWriter)
        writerName.text = wName
        placeTag[0].text = pTag1
        placeTag[1].text = pTag2
        placeTag[2].text = pTag3
    }
}
