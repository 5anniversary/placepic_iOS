//
//  GroupListTVC.swift
//  
//
//  Created by Soojin Lee on 2020/07/04.
//

import UIKit

class GroupListTVC: UITableViewCell {
    @IBOutlet weak var GLProfileImageview: UIImageView!
    @IBOutlet weak var GLNameLabel: UILabel!
    @IBOutlet weak var GLnumofPLabel: UILabel!
    @IBOutlet weak var GLnumofPostLabel: UILabel!
    @IBOutlet weak var GLnomLabel1: UILabel!
    @IBOutlet weak var GLnomLabel2: UILabel!
    @IBOutlet weak var GLtoImageview: UIImageView!
    
    
    static let identifier: String = "GroupListTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configDataInformation(profileImageName: String, name: String, numofPeople:Int, numofPost:Int){
        
         //   GLProfileImageview.image = UIImage(named: profileImageName)
            GLProfileImageview.kf.setImage(with: URL(string: profileImageName))
            GLNameLabel.text = name
            GLnumofPLabel.text = String(numofPeople)
            GLnumofPostLabel.text = String (numofPost)
            

    }
}

extension GroupListTVC{
    
    private func labelStyle(){
        
        GLNameLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        GLNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        GLnumofPLabel.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        GLnumofPLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        GLnomLabel1.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        GLnomLabel1.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        GLnumofPostLabel.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        GLnumofPostLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        GLnomLabel2.textColor = UIColor(red: 0.678, green: 0.714, blue: 0.741, alpha: 1)
        GLnomLabel2.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        
        
        
        
        
        
    }
    
}
