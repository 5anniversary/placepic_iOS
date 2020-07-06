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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDataInformation(profileImageName: String, name: String, numofPeople:String, numofPost:String){
        
            GLProfileImageview.image = UIImage(named: profileImageName)
            GLNameLabel.text = name
            GLnumofPLabel.text = numofPeople
            GLnumofPostLabel.text = numofPost
            

    }
}

extension GroupListTVC{
    
    
}
