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
    
    var groupimage1 : String! = ""
    var groupname1 : String! = ""
    

        
    @IBOutlet weak var groupImageview: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var Label2: UILabel!

    @IBOutlet weak var button2: UIButton!
    @IBAction func buttonAction(_ sender: Any) {
 
        navigationController?.popToRootViewController(animated: true)
             
        
    }
    
   // var model: SubwayModel?
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: animated)
       }

       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           navigationController?.setNavigationBarHidden(false, animated: animated)
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        setalertlabel()
        setbutton()
        groupImageview.layer.cornerRadius = groupImageview.frame.height/2
//        let groupimage1 = ""
//        let groupname1 = ""
        
//        GroupUpVC.groupinfo.groupName
//        GroupUpVC.groupinfo.groupImage
        
        
        let url = URL(string: groupimage1)
        groupImageview.kf.setImage(with: url)
       
        // Do any additional setup after loading the view.
    }
    

//    private func setNavi() { //타이틀이 가운데에 있는 네비
//               guard let navigationBar = self.navigationController?.navigationBar else { return }
//               
//               navigationBar.isTranslucent = true
//               navigationBar.backgroundColor = UIColor.clear
//               navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//               navigationBar.shadowImage = UIImage()
//               
//               let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrowIc"),
//                                                                 style: .plain,
//                                                                 target: self,
//                                                                 action: #selector(dismissVC))
//               
//               navigationItem.leftBarButtonItem = leftButton
//               navigationItem.title = "승인 대기중인 그룹"
//           }
//           
//           @objc func dismissVC() {
//               navigationController?.popViewController(animated: true)
//               
//               let transform = CGAffineTransform(translationX: 0, y: 100)
//               self.tabBarController?.tabBar.isHidden = false
//               tabBarController?.tabBar.transform = transform
//               
//               UIView.animate(withDuration: 0.5,
//                              delay: 0,
//                              usingSpringWithDamping: 1,
//                              initialSpringVelocity: 1,
//                              options: .curveEaseOut,
//                              animations: {
//                               self.tabBarController?.tabBar.transform = .identity
//                               
//               }, completion: nil)
//           }
    
}


extension SendVC{
    
    private func setbutton(){
       
        
        
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
        alertLabel.attributedText = NSMutableAttributedString(string: "\(groupname1) 가입 신청이 \n완료되었습니다! :(", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        Label2.frame = CGRect(x: 0, y: 0, width: 141, height: 34)
        Label2.backgroundColor = .white
        Label2.textColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1)
        Label2.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        Label2.numberOfLines = 0
        Label2.lineBreakMode = .byWordWrapping
        Label2.textAlignment = .center
        Label2.text = "관리자의 승인 이후 그룹에 참여하실 수 있습니다.\n승인 결과는 푸시알림으로 알려드립니다."


        
        
     
        
    }
}
