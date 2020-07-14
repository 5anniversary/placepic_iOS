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
    
    let usefulKeywordModel: [String] = []
    var nearstationData: [SubwayData] = []
    var keywordData: [KeywordData] = []
    var usefulKeywordData: [UsefulInformData] = []
    var photoArray: [UIImage]! = []
    
    var storageKeywordData: [KeywordData] = []
    var storageUsefulKeywordData: [UsefulInformData] = []
    
    var articleTitle: String = ""
    var classifyBadge: String = ""
    
    lazy var keywordModal: KeywordLauncher = {
        let launcher = KeywordLauncher()
        launcher.uploadVC = self
        return launcher
    }()
    
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
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc private func changeDefaultCellHeight(_ notification: NSNotification) {
        
        guard let injectedModel = notification.userInfo?["model"] as? [SubwayData] else { return }
        nearstationData = injectedModel
        collectionView.reloadData()
    }
    
    func returnNearStationDynamicHeight() -> CGSize {
        let width = view.frame.width
        /// `flag 도입하면 지하철역 돌아갔다 와도 괜춘겠네욤`
        if nearstationData.count != 0 {
            return CGSize(width: width, height: 90)
        } else {
            return CGSize(width: width, height: 60)
        }
    }
    
    func returnKeywordDynamicHeight() -> CGFloat {
        let width = UIScreen.main.bounds.width - 20
        let height: CGFloat = 24
        let itemspacing: CGFloat = 10
        
        var floor: CGFloat = 1
        var heightTemp: CGFloat = 0
        
        if storageKeywordData.count == 0 {
            return CGFloat(60)
        } else {
            storageKeywordData.forEach {
                guard let nameWidth = $0.tagName?.width(withConstrainedHeight: 24, font: .boldSystemFont(ofSize: 14)) else { return }
                heightTemp += nameWidth + itemspacing + 20
                
                if width < heightTemp {
                    floor += 1
                    heightTemp = 0
                }
            }
            return height * floor
        }
    }
    
    
    func returnUsefulInfoDynamicHeight() -> CGFloat {
        let width = UIScreen.main.bounds.width - 20
        let height: CGFloat = 24
        let itemspacing: CGFloat = 10
        
        var floor: CGFloat = 1
        var heightTemp: CGFloat = 0
        
        if storageUsefulKeywordData.count == 0 {
            return CGFloat(60)
        } else {
            storageUsefulKeywordData.forEach {
                guard let nameWidth = $0.tagName?.width(withConstrainedHeight: 24, font: .boldSystemFont(ofSize: 14)) else { return }
                heightTemp += nameWidth + itemspacing + 20
                
                if width < heightTemp {
                    floor += 1
                    heightTemp = 0
                }
            }
            return height * floor
        }
    }
}

//MARK:- 통신
extension ArticleUploadVC {
    
    func setDefaultRequest() {
        KeywordServices.keywordServices.getKeywordRequest { data in
            if let metaData = data {
                self.keywordData = metaData
            }
        }
        
        UsefulInformServices.usefulInformServices.getKeywordRequest { data in
            if let metaData = data {
                self.usefulKeywordData = metaData
            }
        }
    }
}

//MARK:- CollectionView
extension ArticleUploadVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        
        switch indexPath.section {
        case 0:
            return CGSize(width: width, height: 98)
        case 1:
            return returnNearStationDynamicHeight()
        case 2:
            return CGSize(width: width, height: returnKeywordDynamicHeight())
        case 3:
            return CGSize(width: width, height: returnUsefulInfoDynamicHeight())
        case 4:
            return CGSize(width: width, height: 452)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 1)
    }
}

extension ArticleUploadVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NearstaionHeaderCVC", for: indexPath) as? NearstaionHeaderCVC
                else {
                    return UICollectionReusableView()
            }
            let badge = classifyBadge
            let title = articleTitle
            view.mainLabel.text = title
            view.classifyBadge.text = badge
            
            return view
            
        case UICollectionView.elementKindSectionFooter:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NearstationFooterCVC", for: indexPath) as? NearstationFooterCVC
                else {
                    return UICollectionReusableView()
            }
            view.backgroundColor = UIColor.gray20
            return view
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
            if nearstationData.count == 0 {
            } else if nearstationData.count == 1 {
                cell.stackView.isHidden = false
                cell.textFieldArray[1].isHidden = true
                cell.textFieldArray[2].isHidden = true
                
            } else if nearstationData.count == 2 {
                cell.stackView.isHidden = false
                cell.textFieldArray[1].isHidden = true
                
            } else {
                cell.stackView.isHidden = false
            }
            for i in 0..<nearstationData.count {
                cell.textFieldArray[i].text = nearstationData[i].subwayName
            }
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeKeywordCVC", for: indexPath) as? HomeKeywordCVC else {
                return UICollectionViewCell()
            }
            cell.keywordArray = storageKeywordData
            
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
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            //            let newIndexPath = IndexPath(item: 0, section: 0)
            //            self.collectionView.selectItem(at: newIndexPath, animated: true, scrollPosition: .bottom)
            print(#function)
            tempfunction()
            
        } else if indexPath.section == 1 {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "NearstationVC") as? NearstationVC else {
                return
            }
            navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.section == 2 {
            keywordModal.showSettings("키워드", keywordData)
        } else if indexPath.section == 3 {
            keywordModal.showSettings("장소 정보", usefulKeywordData)
        }
    }
    
    func tempfunction() {
        var config = YPImagePickerConfiguration()
        config.showsCrop = .rectangle(ratio: (9/16))
        config.showsPhotoFilters = false
        config.startOnScreen = .library
        config.screens = [.library]
        config.library.defaultMultipleSelection = true
        config.library.maxNumberOfItems = 10
        
        let picker = YPImagePicker(configuration: config)
        photoArray = []
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            if cancelled {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            for item in items {
                switch item {
                // 이미지만 받기때문에 photo case만 처리
                case .photo(let p):
                    // 이미지를 해당하는 이미지 배열에 넣어주는 code
                    self.photoArray.append(p.image)
                default:
                    print("")
                }
            }
            picker.dismiss(animated: true) {
                // picker뷰 dismiss 할 때 이미지가 들어가 있는 collectionView reloadData()
                self.collectionView.reloadData()
            }
        }
        present(picker, animated: true, completion: nil)
    }
    
}
