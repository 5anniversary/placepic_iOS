//
//  ViewController.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
