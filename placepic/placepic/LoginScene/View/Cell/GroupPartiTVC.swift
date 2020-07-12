//
//  GroupPartiTVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/11.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Kingfisher

class GroupPartiTVC: UITableViewCell {
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var label1: UILabel!//name
    @IBOutlet weak var label2: UILabel!//people
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!//post
    @IBOutlet weak var label5: UILabel!
    static let identifier: String = "GroupPartiTVC"
    override func awakeFromNib() {
        super.awakeFromNib()
        labelStyle()
        // Initialization code
    }
        override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func setDataInformation(profileImageName: String, name: String, numofPeople:Int, numofPost:Int){
        //image1.image = UIImage(named: profileImageName)
        
        print(#function)
        image1.kf.setImage(with: URL(string: profileImageName))
        print(URL(string: profileImageName))
        label1.text = name
        label2.text = String(numofPeople)
        label4.text = String (numofPost)
        
        
    }}


extension GroupPartiTVC{
    
    private func labelStyle(){
        
        label1.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        label1.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        label2.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        label2.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        label3.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        label3.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        label4.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        label4.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        label5.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        label5.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        
        
        
        
        
    }
    
}
