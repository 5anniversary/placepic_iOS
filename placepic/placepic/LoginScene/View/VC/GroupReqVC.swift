//
//  GroupReqVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/06.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class GroupReqVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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

}
