//
//  HomeTestVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/05.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import YPImagePicker

class ArticleUploadVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
              
    lazy var keywordModal: KeywordLauncher = {
        let launcher = KeywordLauncher()
        launcher.uploadVC = self
        return launcher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setNavigationBar()
    }
    
    @IBAction func testButtonAction(_ sender: Any) {
        
    }
}

extension ArticleUploadVC {
    
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
        rightButton.setTitleColor(.black60, for: .normal)
        
        let rightnavigationButton = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightnavigationButton
        
    }
    
    @objc private func dismissVC() {
        navigationController?.popViewController(animated: true)
        
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ArticleUploadVC: UICollectionViewDelegateFlowLayout {}
extension ArticleUploadVC: UICollectionViewDataSource {
    
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
            return CGSize(width: width, height: 90)
        /// 60에서 90으로 Reload
        case 2:
            return CGSize(width: width, height: 90)
        case 3:
            return CGSize(width: width, height: 90)
        case 4:
            return CGSize(width: width, height: 452)
        default:
            assert(false)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Notification 받아서 그냥 다 Reload 때리자
        // reload 방식은
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
            keywordModal.showSettings("어어어")
        }
    }
}
