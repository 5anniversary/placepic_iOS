//
//  TabbarController.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension TabbarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        let isModalView = viewController is WriteNavigationController    
        if isModalView {
            guard let vc =  storyboard?.instantiateViewController(identifier: "WriteNavigationController") as? WriteNavigationController else { return false }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
            return false
        }
        return true
    }
}

