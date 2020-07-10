//
//  ArticleUploadVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/05.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import YPImagePicker
import Alamofire

class ArticleUploadVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let keywordModel: [String] = []
    let usefulKeywordModel: [String] = []
    var nearStationModel: [StationModel] = []
    var frame: CGRect!
    lazy var paramStationModel: [StationModel] = []
    
    lazy var keywordModal: KeywordLauncher = {
        let launcher = KeywordLauncher()
        launcher.uploadVC = self
        return launcher
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setNavigationBar()
        addObserver()
        setDefaultRequest()
    }
}

extension ArticleUploadVC {
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeDefaultCellHeight), name: .homeSendmodelNotification, object: nil)
    }
    
    private func setNavigationBar() {
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
        navigationItem.title = "최애장소 등록하기"
        
        let rightButton = UIButton()
        rightButton.setTitle("등록", for: .normal)
        rightButton.isEnabled = false
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightButton.setTitleColor(.blueGray80, for: .normal)
        
        let rightnavigationButton = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightnavigationButton
    }
    
    @objc private func dismissVC() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setCollectionView() {
        let nearstation = self.nearStationModel
        print("nearstationModel: \(nearstation)")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // 나중에 숨겨주시고요
    private func hideTabBar() {
        frame = self.tabBarController?.tabBar.frame
        let height = frame.size.height
        frame?.origin.y = self.view.frame.size.height + (height)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBarController?.tabBar.frame = self.frame!
        })
    }
    
    @objc private func changeDefaultCellHeight(_ notification: NSNotification) {
        
        guard let injectedModel = notification.userInfo?["model"] as? [StationModel] else { return }
        print("injectedModel: \(injectedModel)")
        
        /// 문제 : injected된 친구들의 개수를 세어야 합니다
        /// 개수를 세어서 cell에서 죽여야 됨
        
        print(injectedModel.count)
        nearStationModel = injectedModel
        
        
        collectionView.reloadData()
    }
    
    func returnDynamicHeight() -> CGSize {
        let width = view.frame.width
        /// cell에 접근해서 처리하고자 함
        
        if nearStationModel.count == 0 {
            return CGSize(width: width, height: 60)
        } else {
            return CGSize(width: width, height: 90)
        }
    }
    
    func setDefaultRequest() {
        print(#function)
        
        KeywordServices.keywordServices.getKeywordRequest { data in
            if let metaData = data {
                print(#function)
                print(metaData)
            }
        }
    }
}

extension ArticleUploadVC: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NearstaionHeaderCVC", for: indexPath) as? NearstaionHeaderCVC
                else {
                    return UICollectionReusableView()
            }
            return view
        default:
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 84)
        } else {
            return CGSize(width: view.frame.width, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        
        switch indexPath.section {
        case 0:
            return CGSize(width: width, height: 98)
        case 1:
            return returnDynamicHeight()
        case 2:
            return returnDynamicHeight()
        case 3:
            return returnDynamicHeight()
        case 4:
            return CGSize(width: width, height: 452)
        default:
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OutterUploadPhotoCVC", for: indexPath) as? OutterUploadPhotoCVC else {
                return UICollectionViewCell()
            }
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindNearstationCVC", for: indexPath) as? FindNearstationCVC else {
                return UICollectionViewCell()
            }
            
            if nearStationModel.count == 0 {
                return cell
            } else if nearStationModel.count == 1 {
                cell.stackView.isHidden = false
                cell.textFieldArray[1].isHidden = true
                cell.textFieldArray[2].isHidden = true
                //                cell.model = nearStationModel[indexPath.item]
            } else if nearStationModel.count == 2 {
                cell.stackView.isHidden = false
                cell.textFieldArray[1].isHidden = true
                //                cell.model = nearStationModel[indexPath.item]
            } else {
                cell.stackView.isHidden = false
            }
            
            for i in 0..<nearStationModel.count {
                cell.textFieldArray[i].text = nearStationModel[i].station
            }
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeKeywordCVC", for: indexPath) as? HomeKeywordCVC else {
                return UICollectionViewCell()
            }
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsefulInformationCVC", for: indexPath) as? UsefulInformationCVC else {
                return UICollectionViewCell()
            }
            return cell
            
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeReviewCVC", for: indexPath) as? HomeReviewCVC else {
                return UICollectionViewCell()
            }
            return cell
            
        default:
            assert(false)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "NearstationVC") as? NearstationVC else {
                return
            }
            navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.section == 2 {
            keywordModal.showSettings("어어어")
        } else if indexPath.section == 3 {
            keywordModal.showSettings("우와아아")
        }
    }
}

extension ArticleUploadVC: UICollectionViewDataSource {
    
    
}
