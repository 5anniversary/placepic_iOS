//
//  Signup3VC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class Signup3VC: UIViewController {
    
    var signupemail : String!
    var signuppw : String!
    var gender : [Int] = [0,0,0]
    
    
    @IBOutlet weak var signupNameLabel: UILabel!
    @IBOutlet weak var signupNameTextfield: UITextField!
    @IBOutlet weak var signupDOBLabel: UILabel!
    @IBOutlet weak var signupDOBTextfield: UITextField!
    @IBOutlet var signup2Textfields: [UITextField]!
    
    @IBOutlet weak var signupGenderLabel: UILabel!
    @IBOutlet weak var signupMaleButton: UIButton!
    @IBOutlet weak var signupFemaleButton: UIButton!
    @IBOutlet weak var signupQgenderButton: UIButton!
    @IBOutlet weak var signup2sendButton: UIButton!
    @IBAction func sendButtonaction(_ sender: Any) {
        
        guard let vc =  self.storyboard?.instantiateViewController(withIdentifier: "SignupSuccess") as? SignupSuccess else {return} //App crashes here
        vc.modalPresentationStyle = .fullScreen
        
        
        
        self.present(vc, animated: true, completion: nil)
        
        guard let signupname = signupNameTextfield.text else{return}
        guard let signupDOB = signupDOBTextfield.text else{return}
        let signupGender = genderreturn()
        
        
        SignupService.shared.signup(email:  signupemail, password: signuppw, userName: signupname , userBirth: signupDOB , gender: signupGender ) { networkResult in
            switch networkResult {
                
            case .success(let token):
                print("제발.")
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                
                guard let vc =  self.storyboard?.instantiateViewController(withIdentifier: "SignupSuccess") as? SignupSuccess else {return} //App crashes here
                vc.modalPresentationStyle = .fullScreen
                
                self.present(vc, animated: false, completion: nil)
                //
                //                let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupSuccess") as! SignupSuccess
                //                print("네비")
                //                self.navigationController?.pushViewController(secondViewController, animated: true)
            //
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
//                guard let message = message as? String else { return }
//                let alertViewController = UIAlertController(title: "회원가입 실패", message: message,
//                                                            preferredStyle: .alert)
//                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//                alertViewController.addAction(action)
//                self.present(alertViewController, animated: true, completion: nil)
                case .serverErr: print("serverErr")
                case .networkFail: print("networkFail")
            }
        }
    }
    
    @IBAction func buttonaction1(_ sender: Any) {
        
        signupMaleButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
        signupMaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupMaleButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        signupFemaleButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupFemaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupFemaleButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        signupQgenderButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupQgenderButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupQgenderButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        gender[0] = 1
        gender[1] = 0
        gender[2] = 0
        
        if(signupNameTextfield != nil && signupDOBTextfield != nil ){
            
            signup2sendButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
            signup2sendButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        
        
        
        
        
    }
    @IBAction func buttonaction2(_ sender: Any) {
        signupFemaleButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
        signupFemaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupFemaleButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        signupMaleButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupMaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupMaleButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        signupQgenderButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupQgenderButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupQgenderButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        gender[0] = 0
        gender[1] = 1
        gender[2] = 0
        
        if(signupNameTextfield != nil && signupDOBTextfield != nil ){
            
            
            signup2sendButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
            signup2sendButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        
    }
    
    @IBAction func buttonaction3(_ sender: Any) {
        signupQgenderButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
        signupQgenderButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupQgenderButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        signupMaleButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupMaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupMaleButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        signupFemaleButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupFemaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupFemaleButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        
        gender[0] = 0
        gender[1] = 0
        gender[2] = 1
        
        if(signupNameTextfield != nil && signupDOBTextfield != nil ){
            
            
            signup2sendButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
            signup2sendButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        setButtons()
        self.signupDOBTextfield.setInputViewDatePicker(target: self, selector: #selector(tapDone)) //1
        setNavi()
        
        
        
        
        
        // Do any additional setup after loading the view.
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
        navigationItem.title = "회원가입"}
    
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
    
    @objc func tapDone() {
        if let datePicker = self.signupDOBTextfield.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateStyle = .medium // 2-3
            self.signupDOBTextfield.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.signupDOBTextfield.resignFirstResponder() // 2-5
        
        
        
    }
    
    private func setLabel(){
        
        signupNameLabel.text = "이름"
        signupNameLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        signupNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        //        signupPwcheckValLabel.textColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1)
        //        signupPwcheckValLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        //        signupPwcheckValLabel.text = "비밀번호가 일치하지 않습시다. 다시 한번 확인해보세요"
        
        signupDOBLabel.text = "생년월일"
        signupDOBLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        signupDOBLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        signupGenderLabel.text = "성별"
        signupGenderLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        signupGenderLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
    }
    
    
    private func setButtons() {
        for i in 0..<signup2Textfields.count {
            
            //                    signupTxtFields[i].addTarget(self, action: #selector(textFieldDidChage(_:)), for: .editingChanged)//
            
            //            signupNameTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            signupNameTextfield.addTarget(self, action: #selector(textFieldTapped(_:)), for: .editingDidBegin)
            signupNameTextfield.addTarget(self, action: #selector(textFieldEnd(_:)), for: .editingDidEnd)
            //             signupMaleButton.addTarget(self, action: #selector(buttontapped(_:)), for: .editing)
            
            signup2Textfields[i].layer.cornerRadius = 8
            signup2Textfields[i].layer.borderWidth = 1
            signup2Textfields[i].layer.borderColor = UIColor.white.cgColor
            signup2Textfields[i].clipsToBounds = true
            signup2Textfields[i].backgroundColor =  UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
            //            signup2Textfields[i].backgroundColor = .white
            //            signup2Textfields[i].layer.borderColor = UIColor.white.cgColor
            //            signup2Textfields[i].layer.backgroundColor = UIColor.white.cgColor
            //            signup2Textfields[i].frame = CGRect(x: 0, y: 0, width: 347, height: 44)
            //                signupTxtFields[i].layer.borderColor = UIColor.white.cgColor
            signup2Textfields[i].clipsToBounds = true
            //            signup2Textfields[i].setLeftPaddingPoints(10)
            signup2Textfields[0].placeholder = "이름을 입력해주세요."
            signup2Textfields[1].placeholder = "생년월일을 입력해주세요."
            
            
            
            
            
            
        }
        
        signupDOBTextfield.backgroundColor =
            UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
        signupNameTextfield.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
        
        signup2sendButton.layer.cornerRadius = 8
        signup2sendButton.layer.borderWidth = 1
        signup2sendButton.layer.borderColor = UIColor.white.cgColor
        signup2sendButton.clipsToBounds = true
        //            signup1Button.layer.backgroundColor = UIColor.calculatorColor(.soptColor).cgColor
        signup2sendButton.setTitle("회원가입(2/2)", for: .normal)
        signup2sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signup2sendButton.setTitleColor(.white, for: .normal)
        signup2sendButton.backgroundColor = .white
        signup2sendButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        
        //        logintapButton.backgroundColor = UIColor.black
        signup2sendButton.setTitleColor(UIColor(red: 0.808, green: 0.835, blue: 0.855, alpha: 1), for: .normal)
        signup2sendButton.layer.borderWidth = 1
        //        signup2sendButton.layer.borderColor = UIColor.black.cgColor
        //        signup2sendButton.frame = CGRect(x: 0, y: 0, width: 347, height: 50)
        
        
        
        //        signupMaleButton.frame = CGRect(x: 0, y: 0, width: 110, height: 44)
        signupMaleButton.backgroundColor = .white
        signupMaleButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupMaleButton.layer.cornerRadius = 8
        signupMaleButton.setTitle("남성", for: .normal)
        signupMaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupMaleButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        signupFemaleButton.backgroundColor = .white
        signupFemaleButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupFemaleButton.layer.cornerRadius = 8
        signupFemaleButton.setTitle("여성", for: .normal)
        signupFemaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupFemaleButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)
        
        signupQgenderButton.backgroundColor = .white
        signupQgenderButton.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupQgenderButton.layer.cornerRadius = 8
        signupQgenderButton.setTitle("기타", for: .normal)
        signupQgenderButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signupQgenderButton.setTitleColor(UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1), for: .normal)}
    
    @objc private func textFieldTapped(_ signupTxtFields: UITextField) {
        
        
        signupNameTextfield.backgroundColor = UIColor.white
        signupNameTextfield.layer.borderColor = UIColor.black.cgColor
        signupNameTextfield.layer.borderWidth = 1
        
    }
    
    
    @objc private func textFieldEnd(_ signupTxtFields: UITextField) {
        
        
        signupNameTextfield.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
        signupNameTextfield.layer.borderColor = UIColor.white.cgColor
        signupNameTextfield.layer.borderWidth = 1
        
    }
}

extension Signup3VC {
    private func genderreturn()-> Int {
        
        if (gender[0]==1)
        { return 0 }
        else if (gender[1]==1)
        { return 1 }
        else if (gender[2]==1)
        { return 2 }
            
        else { return 3 }
        
        
    }
}

extension UITextField {
    
    
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.locale = .autoupdatingCurrent
        datePicker.datePickerMode = .date //2
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}

