//
//  ViewController.swift
//  PagerStripDemo
//
//  Created by Sayalee on 4/19/18.
//  Copyright © 2018 Assignment. All rights reserved.

import UIKit
import XLPagerTabStrip

class SearchVC: ButtonBarPagerTabStripViewController {
    
//    var dataset: placeData?
    @IBOutlet var buttons: [UIButton]!
    var frame: CGRect!
    var label: UILabel!
    
    var keywordData: [KeywordData] = []
    var usefulData: [UsefulInformData] = []
    
    lazy var keywordModal: KeywordLauncher = {
        let launcher = KeywordLauncher()
        launcher.searchVC = self
        return launcher
    }()
    
    override func viewDidLoad() {
        configureButtonBar()
        super.viewDidLoad()
        setNavigationBar()
        setButtons()
        addObserver()
        setDefaultRequest()
        
    }
    @IBAction func nearstationButtonAction (_ sender: Any) {

        let sb = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "subwayNavigation")
        present(vc, animated: true)
    }
    @IBAction func keywordButtonAction(_ sender: Any) {
        keywordModal.showSettings("키워드", keywordData)
    }
    @IBAction func usefulInfoButtonAction(_ sender: Any) {
        keywordModal.showSettings("장소 정보", usefulData)
    }
        
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(buttonHidden), name: .changeChildViewVC, object: nil)
    }
    
    @objc func buttonHidden(_ notification: NSNotification) {
        guard let childNumber = notification.userInfo?["childNumber"] as? String else { return }
        print(childNumber)
        
        if childNumber == "전체" {
            buttons[1].isHidden = true
            buttons[2].isHidden = true
        } else {
            buttons.forEach({
                $0.isHidden = false
            })
        }
    }
    
    func set() {
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            print(changeCurrentIndex)
            
            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
            newCell?.label.textColor = UIColor.white
            print(progressPercentage)
            print(changeCurrentIndex)
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    // MARK: - Configuration
    
    private func hideTabBar() {
        frame = self.tabBarController?.tabBar.frame
        let height = frame.size.height
        frame?.origin.y = self.view.frame.size.height + (height)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBarController?.tabBar.frame = self.frame!
        })
    }
    
    func setButtons() {
        for i in 0..<3 {
            buttons[i].layer.cornerRadius = 4
        }
    }
    
    func getWidth(text: String) -> CGFloat {
        let txtField = UITextField(frame: .zero)
        txtField.text = text
        txtField.sizeToFit()
        return txtField.frame.size.width
    }
    
    private func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let titleLabel = UILabel()
        titleLabel.text = "플레이스"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftItem
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

//MARK: - 통신
extension SearchVC {
    
    func setDefaultRequest() {
        KeywordServices.keywordServices.getKeywordRequest { data in
            if let metaData = data {
                self.keywordData = metaData
            }
        }
        UsefulInformServices.usefulInformServices.getKeywordRequest { data in
            if let metaData = data {
                self.usefulData = metaData
            }
        }
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

//extension SearchVC: HomeVC {
//    lazy var settingsLauncher: KeywordLauncher = {
//          let launcher = KeywordLauncher()
//          launcher.homeController = self
//          return launcher
//    }()



