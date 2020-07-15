//
//  SendVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Kingfisher

class SendVC: UIViewController {
    @IBOutlet weak var groupImageview: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var model: SubwayModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setalertlabel()
        setbutton()
        groupImageview.layer.cornerRadius = groupImageview.frame.height/2
        
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%91%E1%85%B5%E1%84%8F%E1%85%A1%E1%84%8E%E1%85%B2.png?alt=media&token=68c2ffff-81a5-4db9-a67e-b776242cea02")
        groupImageview.kf.setImage(with: url)
       
        // Do any additional setup after loading the view.
    }
    

    
    
}


extension SendVC{
    
    private func setbutton(){
        button1.layer.cornerRadius = 8
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.white.cgColor
        button1.clipsToBounds = true
        button1.setTitle("다시 신청하기", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button1.setTitleColor(.white, for: .normal)
        button1.backgroundColor = .white
        button1.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        button1.setTitleColor(UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
            , for: .normal)
        
        
        button2.layer.cornerRadius = 8
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.white.cgColor
        button2.clipsToBounds = true
        button2.setTitle("내 그룹으로 돌아가기", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button2.setTitleColor(.white, for: .normal)
        button2.backgroundColor = .white
        button2.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
        button2.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        
     
    }
    
    
    private func setalertlabel(){
        
        
//        alertLabel.frame = CGRect(x: 0, y: 0, width: 139, height: 44)
        
        alertLabel.backgroundColor = .white
        alertLabel.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        alertLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        alertLabel.numberOfLines = 0
        alertLabel.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.81
        alertLabel.textAlignment = .center
        alertLabel.attributedText = NSMutableAttributedString(string: "SOPT 가입 신청이\n거절되었습니다 :(", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        Label2.frame = CGRect(x: 0, y: 0, width: 141, height: 34)
        Label2.backgroundColor = .white
        Label2.textColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1)
        Label2.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        Label2.numberOfLines = 0
        Label2.lineBreakMode = .byWordWrapping
        Label2.textAlignment = .center
        Label2.text = "알맞은 정보를 입력했는지\n다시 한 번 확인해주세요."


        
        
     
        
    }
}
