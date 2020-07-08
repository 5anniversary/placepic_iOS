//
//  SendVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SendVC: UIViewController {
    @IBOutlet weak var groupImageview: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setalertlabel()

        // Do any additional setup after loading the view.
    }
    

    
    
}
extension SendVC{
    
    
    private func setalertlabel(){
        
        
//        alertLabel.frame = CGRect(x: 0, y: 0, width: 139, height: 44)
        
        alertLabel.backgroundColor = .white
        
        
        alertLabel.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        
        alertLabel.font = UIFont(name: "SpoqaHanSans-Bold", size: 18)
        
        alertLabel.numberOfLines = 0
        
        alertLabel.lineBreakMode = .byWordWrapping
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineHeightMultiple = 0.81
        
        
        // Line height: 22 pt
        
        
        alertLabel.textAlignment = .center
        
        alertLabel.attributedText = NSMutableAttributedString(string: "SOPT 가입 신청이\n승인되었습니다 :)", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        
     
        
    }
}
