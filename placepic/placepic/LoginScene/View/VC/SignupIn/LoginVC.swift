//
//  ViewController.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var fullView: UIView!
    @IBOutlet weak var loginLabel: UIButton!
    @IBOutlet weak var signupLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "SigninVC") as? SigninVC
            else {
                return 
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signupButtonTapped(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "SignupVC") as? SignupVC
            else {
                return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
            
    //        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "icMenuHamburg"),
    //                                                          style: .plain,
    //                                                          target: self,
    //                                                          action: #selector(showSideMenuBar))
    //        navigationItem.leftBarButtonItem = leftButton
        }

extension LoginVC {
    private func setDesign(){
        
        fullView.backgroundColor = UIColor.warmPink
        
        loginLabel.layer.cornerRadius = 8
        loginLabel.layer.borderWidth = 1
        loginLabel.layer.borderColor = UIColor.white.cgColor
        loginLabel.clipsToBounds = true
        loginLabel.setTitle("로그인", for: .normal)
        loginLabel.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        loginLabel.setTitleColor(.white, for: .normal)
        loginLabel.backgroundColor = .white
        loginLabel.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        loginLabel.setTitleColor(UIColor(red: 0.514, green: 0.529, blue: 0.533, alpha: 1)
            , for: .normal)
        
        
        signupLabel.layer.cornerRadius = 8
        signupLabel.layer.borderWidth = 1.5
        signupLabel.layer.borderColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        signupLabel.clipsToBounds = true
        signupLabel.setTitle("회원가입", for: .normal)
        signupLabel.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signupLabel.setTitleColor(.white, for: .normal)
        signupLabel.backgroundColor = UIColor.warmPink
//        signupButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
        signupLabel.setTitleColor(UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1), for: .normal)
    }
}
