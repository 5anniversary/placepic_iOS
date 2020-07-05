//
//  ViewController.swift
//  PagerStripDemo
//
//  Created by Sayalee on 4/19/18.
//  Copyright © 2018 Assignment. All rights reserved.

import UIKit
import XLPagerTabStrip

class SearchVC: ButtonBarPagerTabStripViewController {
    
    @IBOutlet var butSubway: UIButton!
    @IBOutlet var buy1: UIButton!
    
    
    override func viewDidLoad() {
        configureButtonBar()
        super.viewDidLoad()
        setNavigationBar()
        
//        text1.text = "aaa"
//        text1.frame.size.width = 15
//        text1.
//        navigationController?.navigationBar.isHidden = true
//        viewPager.translatesAutoresizingMaskIntoConstraints = false
//
//        viewPager.frame = CGRect.init(x: 0, y: 44, width: view.frame.width, height: 44)
//
//        let constraints = [
//            viewPager.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 44),
//             viewPager.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//
    }

//    func textFieldDidChange(sender: UITextField) {
//        sender.invalidateIntrinsicContentSize()
//    }
//
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Configuration
    func getWidth(text: String) -> CGFloat {
        let txtField = UITextField(frame: .zero)
        txtField.text = text
        txtField.sizeToFit()
        return txtField.frame.size.width
    }
    
    private func setNavigationBar() {
        
        
    }
    func configureButtonBar() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white

        settings.style.buttonBarItemFont = UIFont(name: "Apple SD Gothic Neo", size: 15.0)!
        settings.style.buttonBarItemTitleColor = .gray
        
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0

        settings.style.selectedBarHeight = 3.0
        settings.style.selectedBarBackgroundColor = .black
        
        // Changing item text color on swipe
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = .black
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard.init(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildVC
        child1.childNumber = "전체"
        
        let child2 = UIStoryboard.init(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildVC
        child2.childNumber = "맛집"
        
        let child3 = UIStoryboard.init(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildVC
        child3.childNumber = "술집"
        
        let child4 = UIStoryboard.init(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildVC
        child4.childNumber = "카페"
        
        let child5 = UIStoryboard.init(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildVC
        child5.childNumber = "스터디"
        
        let child6 = UIStoryboard.init(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! ChildVC
        child6.childNumber = "기타"
        
        return [child1, child2, child3, child4, child5, child6]
    }

}

extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}

