//
//  ViewController.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class MypageVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var memberTextFieldLabel: UITextField!
    @IBOutlet weak var affiliationLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var writtenLabel: UILabel!
    @IBOutlet weak var writtenCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        configureMypageUI()
        setDefaultRequest()
    }
}

extension MypageVC {

    func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = "SOPT"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        longTitleLabel.textColor = UIColor.gray90
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        navigationItem.leftBarButtonItem = leftItem
        
    }
    
    private func configureMypageUI() {
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        nameLabel.font = Font.boldFontSize20
        nameLabel.textColor = UIColor.gray90
        memberTextFieldLabel.clipsToBounds = true
        memberTextFieldLabel.layer.borderColor = UIColor.white.cgColor
        memberTextFieldLabel.layer.borderWidth = 2
        memberTextFieldLabel.font = Font.boldFontSize12
        memberTextFieldLabel.textColor = UIColor.blueGray60
        memberTextFieldLabel.backgroundColor = UIColor.blueGray10
        memberTextFieldLabel.isEnabled = false
        affiliationLabel.font = Font.fontSize14
        affiliationLabel.textColor = UIColor.blueGray40
        backgroundView.layer.cornerRadius = 10
        backgroundView.backgroundColor = UIColor.gray10
        writtenLabel.font = Font.fontSize15
        writtenLabel.textColor = UIColor.blueGray70
        writtenCountLabel.font = Font.boldFontSize15
    }
    
    @objc func dismissVC() {
        
    }
}
//MARK: - 통신
extension MypageVC {
    
    func setDefaultRequest() {
        MypageServices.mypageServices.mypage { data in
            if let metaData = data {
                
                guard let imageURL = metaData.userImage else { return }
                guard let name = metaData.userName else { return }
                guard let postCount = metaData.postCount else { return }
                guard let part = metaData.part else { return }
                guard let state = metaData.state else { return }
               
                self.profileImage.kf.setImage(with: URL(string: imageURL))
                self.nameLabel.text = name
                self.affiliationLabel.text = part
                self.memberTextFieldLabel.text = state == 0 ? "관리자" : postCount == 1 ? "멤버" : "대기"
                self.writtenCountLabel.text = String(describing: postCount)
                
                self.viewWillAppear(true)

            }
        }
    }
}
