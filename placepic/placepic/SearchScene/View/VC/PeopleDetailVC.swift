//
//  PeopleDetailVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/06.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class PeopleDetailVC: UIViewController {
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelPart: UILabel!
    @IBOutlet var labelBirth: UILabel!
    @IBOutlet var labelPhone: UILabel!
    @IBOutlet var labelGender: UILabel!
    
    @IBOutlet var butAdmin: [UIButton]!
    
    var selectedData: adminListModel?
    
    @IBAction func butAccept(_ sender: Any) {
        
    }
//    @IBAction func registerButton(_ sender: Any) {
//        guard let inputID = idTextField.text else { return }
//        guard let inputPWD = passTextField.text else { return }
//        guard let inputNAME = nameTextField.text else { return }
//        guard let inputEMAIL = emailTextField.text else { return }
//        guard let inputPHONE = phoneTextField.text else { return }
//
//        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
//            switch networkResult {
//            case .success:
//                guard let signinController = self.storyboard?.instantiateViewController(identifier: "SigninViewController") as? ViewController else { return }
//
//                signinController.textID = inputID
//                signinController.textPWD = inputPWD
//
//                self.dismiss(animated: true, completion: nil)
//                self.navigationController?.pushViewController(signinController, animated: true)
//
//            case .requestErr(let message):
//                guard let message = message as? String else { return }
//                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
//                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//                alertViewController.addAction(action)
//                self.present(alertViewController, animated: true, completion: nil)
//            case .pathErr: print("path")
//            case .serverErr: print("serverErr")
//            case .networkFail: print("networkFail")
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setButton()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        labelName.text = selectedData?.name
        labelPart.text = selectedData?.part
        labelBirth.text = selectedData?.birth
        labelPhone.text = selectedData?.phone
        labelGender.text = selectedData?.gender
    }
    
    func setButton(){
        for i in 0..<2{
            butAdmin[i].layer.cornerRadius = 8
        }
    }
   
}
