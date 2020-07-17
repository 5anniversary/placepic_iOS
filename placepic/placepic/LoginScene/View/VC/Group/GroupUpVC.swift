//
//  GroupUpVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit


class GroupUpVC: UIViewController {
    @IBOutlet weak var belongLabel: UILabel!
    @IBOutlet weak var belongTxtbox: UITextField!
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var partTxtbox: UITextField!
    @IBOutlet var TextFields: [UITextField]!
    @IBOutlet weak var sendButton: UIButton!
    
    var inputpart : String!
    var inputnum : String!
    var groupinfo : Groupdata!
    @IBAction func sendActionButton(_ sender: Any) {
        
        guard let inputpart = belongTxtbox.text else { return }
        guard let inputnum = partTxtbox.text else { return }
        
        let groupIdx2 = UserDefaults.standard.integer(forKey: "groupIdx")
        
        GroupUpService.shared.signup(part: inputpart, phoneNumber: inputnum, groupIdx: groupIdx2 ) { networkResult in
            switch networkResult {
                
            case .success(let groupinfo):
                print("sadadasdasd")
                let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SendVC") as! SendVC
//                secondViewController.groupimage1 = groupinfo.groupName
//                secondViewController.groupname1 = groupinfo.groupImage
                self.navigationController?.pushViewController(secondViewController, animated: true)
                
                guard let groupinfo = groupinfo as? Groupdata else { return }
                
                
                
                
                
                
                
                //                let GroupController = self.storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as SecondViewController
                //                self.navigationController.pushViewController(secondViewController, animated: true)
            //                self.present(GroupListVC, animated: true, completion: nil)
            case .requestErr(let message):
                print("21312313")
                //                guard let message = message as? String else { return }
                //                let alertViewController = UIAlertController(title: "로그인 실패", message: message,
                //                                                            preferredStyle: .alert)
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "그룹신청 실패", message: message,
                                                            preferredStyle: .alert)
                alertViewController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alertViewController, animated: true)
                
               
        
                //                alertViewController.addAction(action)
                //                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            let alert = UIAlertController(title: "로그인에 실패하였습니다.", message: "입력하신 이메일과 비밀번호를 확인 후 다시 확인해주세요.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            
            self.present(alert, animated: true)
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelLooksLike()
        setButtonsLooksLike()
        //            setButtonSuc()
        setNavigationBar()
        setNavi()
        sendButton.isEnabled = false
        
    }
    
    
    
    
    private func setLabelLooksLike(){
        
        
        
        belongLabel.text = "소속"
        belongLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        belongLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        
        partLabel.text = "핸드폰 번호"
        partLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        partLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
    }
    
    private func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.white
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        //        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "icMenuHamburg"),
        //                                                          style: .plain,
        //                                                          target: self,
        //                                                          action: #selector(showSideMenuBar))
        //        navigationItem.leftBarButtonItem = leftButton
    }
    
    
    private func setButtonsLooksLike() {
        for i in 0..<TextFields.count {
            
            
            belongTxtbox.addTarget(self, action: #selector(textFieldTapped(_:)), for: .editingDidBegin)
            belongTxtbox.addTarget(self, action: #selector(textFieldEnd(_:)), for: .editingDidEnd)
            
            
            partTxtbox.addTarget(self, action: #selector(textFieldTapped2(_:)), for: .editingDidBegin)
            partTxtbox.addTarget(self, action: #selector(textFieldEnd2(_:)), for: .editingDidEnd)
            partTxtbox.addTarget(self, action: #selector(textFieldDidChange2(_:)), for: .editingChanged)
            
            
            
            TextFields[i].layer.cornerRadius = 8
            TextFields[i].layer.borderWidth = 1
            TextFields[i].layer.borderColor = UIColor.white.cgColor
            TextFields[i].clipsToBounds = true
            
            TextFields[i].backgroundColor =  UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
            //                txtFields[i].frame = CGRect(x: 0, y: 0, width: 347, height: 44)
            //                txtFields[i].layer.borderColor = UIColor.white.cgColor
            TextFields[i].setLeftPaddingPoints(10)
            TextFields[0].placeholder = "ex) SOPT 26기 디자인"
            TextFields[1].placeholder = "핸드폰 번호를 입력해주세요."
            
            
        }
        
        sendButton.layer.cornerRadius = 8
        sendButton.layer.borderWidth = 1
        sendButton.layer.borderColor = UIColor.white.cgColor
        sendButton.clipsToBounds = true
        sendButton.setTitle("신청하기", for: .normal)
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.backgroundColor = .white
        sendButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        sendButton.setTitleColor(UIColor(red: 0.808, green: 0.835, blue: 0.855, alpha: 1), for: .normal)
        //                logintapButton.frame = CGRect(x: 0, y: 0, width: 347, height: 50)
    }
    
    private func setNavi() { //타이틀이 가운데에 있는 네비
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrowIc"),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(dismissVC))
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "그룹 가입 신청하기"
    }
    
    
    
    @objc func dismissVC() {
        navigationController?.popViewController(animated: true)
        
        let transform = CGAffineTransform(translationX: 0, y: 100)
        self.tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.transform = transform
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.tabBarController?.tabBar.transform = .identity
                        
        }, completion: nil)
    }
    
    
    //        private func setButtonSuc(){
    //            if ( partTxtbox.text == nil || belongTxtbox.text == nil)
    //            {
    //                sendButton.layer.cornerRadius = 8
    //                sendButton.layer.borderWidth = 1
    //                sendButton.layer.borderColor = UIColor.white.cgColor
    //                sendButton.clipsToBounds = true
    //                sendButton.setTitle("로그인", for: .normal)
    //                sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    //                sendButton.setTitleColor(.white, for: .normal)
    //                sendButton.backgroundColor = .white
    //                sendButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
    //                sendButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    //
    //
    //            }
    //            else {
    //                sendButton.layer.cornerRadius = 8
    //                sendButton.layer.borderWidth = 1
    //                sendButton.layer.borderColor = UIColor.white.cgColor
    //                sendButton.clipsToBounds = true
    //                sendButton.setTitle("로그인", for: .normal)
    //                sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    //                sendButton.setTitleColor(.white, for: .normal)
    //                sendButton.backgroundColor = .white
    //                sendButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
    //                sendButton.setTitleColor(UIColor(red: 0.808, green: 0.835, blue: 0.855, alpha: 1), for: .normal)
    //            }
    //
    //
    //
    //        }
    
    @objc private func textFieldTapped(_ signupTxtFields: UITextField) {
        
        
        belongTxtbox.backgroundColor = UIColor.white
        belongTxtbox.layer.borderColor = UIColor.black.cgColor
        belongTxtbox.layer.borderWidth = 1
        
    }
    
    
    
    @objc private func textFieldEnd(_ signupTxtFields: UITextField) {
        
        
        belongTxtbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
        belongTxtbox.layer.borderColor = UIColor.white.cgColor
        belongTxtbox.layer.borderWidth = 1
        
        
    }
    
    @objc private func textFieldTapped2(_ signupTxtFields: UITextField) {
        
        
        partTxtbox.backgroundColor = UIColor.white
        partTxtbox.layer.borderColor = UIColor.black.cgColor
        partTxtbox.layer.borderWidth = 1
        
        
    }
    
    @objc private func textFieldEnd2(_ signupTxtFields: UITextField) {
        
        
        partTxtbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
        partTxtbox.layer.borderColor = UIColor.white.cgColor
        partTxtbox.layer.borderWidth = 1
        //            setButtonSuc()
        
        
        
    }
    
    @objc private func textFieldDidChange2(_ signupTxtFields: UITextField) {
        if (partTxtbox.text != nil  && belongTxtbox.text != nil)
        {
            sendButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
            sendButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            sendButton.isEnabled = true
        }
    }
    
    
    
    
    
    
    
    
    
    
}
