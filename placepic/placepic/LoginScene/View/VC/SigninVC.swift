//
//  SigninVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SigninVC: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var txtFields: [UITextField]!
    @IBOutlet weak var emailLabel:UILabel!
    @IBOutlet weak var emailTextbox: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextbox: UITextField!
    @IBOutlet weak var emailValidateLabel: UILabel!
    @IBAction func logintapButton(_ sender: UIButton) {
//        guard let inputID = txtFields[0].text else { return }
//        guard let inputPWD = txtFields[1].text else { return }
//
//        txtFields[0].text = nil
//        txtFields[1].text = nil
//
//        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
//            switch networkResult {
//
//            case .success(let token):
//                guard let token = token as? String else { return }
//                print("1312321");
//
//                UserDefaults.standard.set(token, forKey: "token")
//                print("token : \(token)")
//                if self.autoLoginButton.on {
//                    UserDefaults.standard.set(inputID, forKey: "id")
//                    UserDefaults.standard.set(inputPWD, forKey: "pwd")
//                }
//
//                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
//                    "TabbarController") as? UITabBarController else { return }
//
//                tabbarController.modalPresentationStyle = .fullScreen
//                self.present(tabbarController, animated: true, completion: nil)
//
//            case .requestErr(let message):
//
//                guard let message = message as? String else { return }
//                let alertViewController = UIAlertController(title: "로그인 실패", message: message,
//                                                            preferredStyle: .alert)
//                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//                alertViewController.addAction(action)
//                print("err")
//                self.present(alertViewController, animated: true, completion: nil)
//            case .pathErr: print("path")
//            case .serverErr: print("serverErr")
//            case .networkFail: print("networkFail")
//            }
//        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailValidateLabel.text = nil
        
        setLabelLooksLike()
        setButtonsLooksLike()
        setButtonSuc()
   

    }
    
    @objc func textFieldDidChage(_
        : UITextField) {
        emailValidateLabel.alpha = txtFields[0].text?.validateEmail() == false ? 1 : 0
        
    }
    

    private func setLabelLooksLike(){

                
             
                emailLabel.text = "이메일"
                emailLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
                emailLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
                
        
                emailValidateLabel.textColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1)
                emailValidateLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
                emailValidateLabel.text = "알맞은 이메일 형식이 아닙니다!"
                
        
                passwordLabel.text = "비밀번호"
                passwordLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
                passwordLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)

    }
    
    
    private func setButtonsLooksLike() {
            for i in 0..<txtFields.count {
                
                emailValidateLabel.alpha = 0
                emailTextbox.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
                emailTextbox.addTarget(self, action: #selector(textFieldTapped(_:)), for: .editingDidBegin)
                emailTextbox.addTarget(self, action: #selector(textFieldEnd(_:)), for: .editingDidEnd)
                
                
                passwordTextbox.addTarget(self, action: #selector(textFieldTapped2(_:)), for: .editingDidBegin)
                passwordTextbox.addTarget(self, action: #selector(textFieldEnd2(_:)), for: .editingDidEnd)
                          
                
                txtFields[0].addTarget(self, action: #selector(textFieldDidChage(_:)), for: .editingChanged)//
                txtFields[i].layer.cornerRadius = 8
                txtFields[i].layer.borderWidth = 1
                txtFields[i].layer.borderColor = UIColor.white.cgColor
                txtFields[i].clipsToBounds = true

                txtFields[i].backgroundColor =  UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
//                txtFields[i].frame = CGRect(x: 0, y: 0, width: 347, height: 44)
//                txtFields[i].layer.borderColor = UIColor.white.cgColor
                txtFields[i].setLeftPaddingPoints(10)
                txtFields[0].placeholder = "이메일을 입력해주세요."
                txtFields[1].placeholder = "비밀번호를 입력해주세요."
                txtFields[1].isSecureTextEntry = true
                
            }
            
            loginButton.layer.cornerRadius = 8
            loginButton.layer.borderWidth = 1
            loginButton.layer.borderColor = UIColor.white.cgColor
            loginButton.clipsToBounds = true
            loginButton.setTitle("로그인", for: .normal)
            loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.backgroundColor = .white
            loginButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
            loginButton.setTitleColor(UIColor(red: 0.808, green: 0.835, blue: 0.855, alpha: 1), for: .normal)
//                logintapButton.frame = CGRect(x: 0, y: 0, width: 347, height: 50)
    }
    
    private func setButtonSuc(){
        if ( emailTextbox.text?.validateEmail() == true && passwordTextbox.text != nil)
        {
            loginButton.layer.cornerRadius = 8
            loginButton.layer.borderWidth = 1
            loginButton.layer.borderColor = UIColor.white.cgColor
            loginButton.clipsToBounds = true
            loginButton.setTitle("로그인", for: .normal)
            loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.backgroundColor = .white
            loginButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
            loginButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            
            
        }
        else {
            loginButton.layer.cornerRadius = 8
            loginButton.layer.borderWidth = 1
            loginButton.layer.borderColor = UIColor.white.cgColor
            loginButton.clipsToBounds = true
            loginButton.setTitle("로그인", for: .normal)
            loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.backgroundColor = .white
            loginButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
            loginButton.setTitleColor(UIColor(red: 0.808, green: 0.835, blue: 0.855, alpha: 1), for: .normal)
        }
        
        
        
    }
    
    @objc private func textFieldTapped(_ signupTxtFields: UITextField) {
           
           
           emailTextbox.backgroundColor = UIColor.white
           emailTextbox.layer.borderColor = UIColor.black.cgColor
           emailTextbox.layer.borderWidth = 1
           
       }
       
       @objc private func textFieldDidChange(_ signupTxtFields: UITextField) {
              
              emailValidateLabel.alpha = emailTextbox.text?.validateEmail() == false ? 1 : 0
              
              
              
              //        signupPwcheckValLabel.alpha = signupTxtFields[2].text?.validatePasswd() == false ? 1 : 0
          }

       
         @objc private func textFieldEnd(_ signupTxtFields: UITextField) {
             
             
             emailTextbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
             emailTextbox.layer.borderColor = UIColor.white.cgColor
             emailTextbox.layer.borderWidth = 1
             
             
         }
    
    @objc private func textFieldTapped2(_ signupTxtFields: UITextField) {
           
           
           passwordTextbox.backgroundColor = UIColor.white
           passwordTextbox.layer.borderColor = UIColor.black.cgColor
           passwordTextbox.layer.borderWidth = 1
        
           
       }
       
         @objc private func textFieldEnd2(_ signupTxtFields: UITextField) {
             
             
             passwordTextbox.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
             passwordTextbox.layer.borderColor = UIColor.white.cgColor
             passwordTextbox.layer.borderWidth = 1
             setButtonSuc()
                
         }
    }



 
