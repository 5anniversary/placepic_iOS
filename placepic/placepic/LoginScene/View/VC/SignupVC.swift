//
//  SignupVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var signupEmailLabel: UILabel!
    @IBOutlet weak var signupEmailTextbox: UITextField!
    @IBOutlet weak var signupEmailcheckValLabel: UILabel!
    @IBOutlet weak var signupPwLabel: UILabel!
    @IBOutlet weak var signupPwTextbox: UITextField!
    @IBOutlet weak var signupPwcheckLabel: UILabel!
    @IBOutlet weak var signupPwcheckTextbox: UITextField!
    @IBOutlet weak var signupPwcheckValLabel: UILabel!
    @IBOutlet var signupTxtFields: [UITextField]!
    @IBOutlet weak var signup1Button: UIButton!
    
    @IBAction func signup1acButton(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "SignUp2VC") as? SignUp2VC else {
            return
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelLooksLike()
        setButtonsLooksLike()
        setTextfieldsLooksLike()
        
        
        
    }
}

// MARK:- UI - set Function
extension SignupVC {
    
    private func setLabelLooksLike () {
        
        signupEmailLabel.text = "이메일"
        signupEmailLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        signupEmailLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        
        signupEmailcheckValLabel.textColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1)
        signupEmailcheckValLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        signupEmailcheckValLabel.text = "알맞은 이메일 형식이 아닙니다!"
        
        signupPwcheckValLabel.textColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1)
        signupPwcheckValLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        signupPwcheckValLabel.text = "비밀번호가 일치하지 않습시다. 다시 한번 확인해보세요"
        
        
        signupPwLabel.text = "비밀번호"
        signupPwLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        signupPwLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        signupPwcheckLabel.text = "비밀번호 확인"
        signupPwcheckLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        signupPwcheckLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
    }
    
    //MARK:- zxczsxcasdasdasdsa
    private func setButtonsLooksLike() {
        
        signup1Button.layer.cornerRadius = 8
        signup1Button.layer.borderWidth = 1
        signup1Button.layer.borderColor = UIColor.white.cgColor
        signup1Button.clipsToBounds = true
        //            signup1Button.layer.backgroundColor = UIColor.calculatorColor(.soptColor).cgColor
        signup1Button.setTitle("다음(1/2)", for: .normal)
        signup1Button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signup1Button.setTitleColor(.white, for: .normal)
        signup1Button.backgroundColor = .white
        signup1Button.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        
        //        logintapButton.backgroundColor = UIColor.black
        signup1Button.setTitleColor(UIColor(red: 0.808, green: 0.835, blue: 0.855, alpha: 1), for: .normal)
        //        logintapButton.layer.borderWidth = 1
        //        logintapButton.layer.borderColor = UIColor.black.cgColor
        //                logintapButton.frame = CGRect(x: 0, y: 0, width: 347, height: 50)
    }
    
    private func setTextfieldsLooksLike(){
        //        signupEmailcheckValLabel.text = nil
        //        signupPwcheckValLabel.text = nil
        
        for i in 0..<signupTxtFields.count {
            
            signupEmailcheckValLabel.alpha = 0
            signupPwcheckValLabel.alpha = 0
            signupEmailTextbox.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            signupEmailTextbox.addTarget(self, action: #selector(textFieldTapped(_:)), for: .editingDidBegin)
            signupEmailTextbox.addTarget(self, action: #selector(textFieldEnd(_:)), for: .editingDidEnd)
            
            signupPwTextbox.addTarget(self, action: #selector(textFieldTapped2(_:)), for: .editingDidBegin)
            signupPwTextbox.addTarget(self, action: #selector(textFieldEnd2(_:)), for: .editingDidEnd)
            
            
            signupPwcheckTextbox.addTarget(self, action: #selector(textFieldDidChange3(_:)), for: .editingChanged)
            signupPwcheckTextbox.addTarget(self, action: #selector(textFieldTapped3(_:)), for: .editingDidBegin)
            signupPwcheckTextbox.addTarget(self, action: #selector(textFieldEnd3(_:)), for: .editingDidEnd)
            
            
            signupTxtFields[i].layer.cornerRadius = 8
            signupTxtFields[i].layer.borderWidth = 1
            signupTxtFields[i].layer.borderColor = UIColor.white.cgColor
            signupTxtFields[i].clipsToBounds = true
            signupTxtFields[i].backgroundColor =  UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
            signupTxtFields[i].setLeftPaddingPoints(10)
            signupTxtFields[0].placeholder = "이메일을 입력해주세요."
            signupTxtFields[1].placeholder = "비밀번호를 입력해주세요."
            signupTxtFields[2].placeholder = "비밀번호를 다시 입력해주세요."
            signupTxtFields[1].isSecureTextEntry = true
            signupTxtFields[2].isSecureTextEntry = true
        }
    }
    
    @objc private func textFieldTapped(_ signupTxtFields: UITextField) {
        signupEmailTextbox.backgroundColor = UIColor.white
        signupEmailTextbox.layer.borderColor = UIColor.black.cgColor
        signupEmailTextbox.layer.borderWidth = 1
    }
    
    @objc private func textFieldDidChange(_ signupTxtFields: UITextField) {
        
        signupEmailcheckValLabel.alpha = signupEmailTextbox.text?.validateEmail() == false ? 1 : 0
        print(#function)
        signupEmailTextbox.layer.borderColor = signupEmailTextbox.text?.validateEmail() == false ? UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1).cgColor : UIColor.black.cgColor
        
        //        if(signupEmailTextbox.text?.validateEmail() == true && signupPwTextbox.text == signupPwcheckTextbox.text && signupPwTextbox.text != nil
        //            && signupPwcheckTextbox.text != nil){
        //
        //
        //               signup1Button.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
        //               signup1Button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        //        signupPwcheckValLabel.alpha = signupTxtFields[2].text?.validatePasswd() == false ? 1 : 0
        //           }
        
        
        
        
        //        signupPwcheckValLabel.alpha = signupTxtFields[2].text?.validatePasswd() == false ? 1 : 0
    }
    
    @objc private func textFieldEnd(_ signupTxtFields: UITextField) {
        signupEmailTextbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
        signupEmailTextbox.layer.borderColor = UIColor.white.cgColor
        signupEmailTextbox.layer.borderWidth = 1
    }
    
    @objc private func textFieldTapped2(_ signupTxtFields: UITextField) {
        signupPwTextbox.backgroundColor = UIColor.white
        signupPwTextbox.layer.borderColor = UIColor.black.cgColor
        signupPwTextbox.layer.borderWidth = 1
        
    }
    
    @objc private func textFieldEnd2(_ signupTxtFields: UITextField) {
        signupPwTextbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
        signupPwTextbox.layer.borderColor = UIColor.white.cgColor
        signupPwTextbox.layer.borderWidth = 1
    }
    
    @objc private func textFieldTapped3(_ signupTxtFields: UITextField) {
        signupPwcheckTextbox.backgroundColor = UIColor.white
        signupPwcheckTextbox.layer.borderColor = UIColor.black.cgColor
        signupPwcheckTextbox.layer.borderWidth = 1
    }
    
    @objc private func textFieldEnd3(_ signupTxtFields: UITextField) {
//        signupPwcheckTextbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
//        signupPwcheckTextbox.layer.borderColor = UIColor.white.cgColor
//        signupPwcheckTextbox.layer.borderWidth = 1
        print(#function)
    }
    
    @objc private func textFieldDidChange3(_ signupTxtFields: UITextField) {
        print(#function)
        if signupPwTextbox.text != signupPwcheckTextbox.text {
         signupPwcheckValLabel.alpha = 1
            signupPwcheckTextbox.layer.borderColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1).cgColor
        }
           
        else {
            signupPwcheckValLabel.alpha = 0
            signupPwcheckTextbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
            signupPwcheckTextbox.layer.borderColor = UIColor.white.cgColor
            signupPwcheckTextbox.layer.borderWidth = 1
        }
        
        if signupEmailTextbox.text?.validateEmail() == true && signupPwTextbox.text == signupPwcheckTextbox.text {
            signup1Button.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
            signup1Button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            
            //        signupPwcheckValLabel.alpha = signupTxtFields[2].text?.validatePasswd() == false ? 1 : 0
        }
    }
}
