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
        setNavigationBar()
        setNavi()
       
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
        navigationItem.title = "회원가입"
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
}
