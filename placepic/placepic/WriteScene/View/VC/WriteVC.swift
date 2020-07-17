//
//  ViewController.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class WriteVC: UIViewController {
    
    @IBOutlet weak var warningLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setLabel()
    }
}

extension WriteVC {
    
    private func setLabel() {
        
        warningLabel.font = Font.boldFontSize15
        warningLabel.textColor = UIColor.blueGray30
    }

    private func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = "내가 저장한 장소"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        longTitleLabel.textColor = UIColor.gray90
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        navigationItem.leftBarButtonItem = leftItem
        
    }
}
