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
    
    var nearstationData: [SubwayData] = []
    var keywordData: [KeywordData] = []
    var usefulKeywordData: [UsefulInformData] = []
    
    /// 서버 업로드 파라미터
    var photoArray: [UIImage] = []
    var articleTitle: String = ""
    var classifyBadge: String = ""
    var placeSearchData: PlaceSearchData!
    var storageKeywordData: [KeywordData] = []
    var storageUsefulKeywordData: [UsefulInformData] = []
    var forUploadKeyword: [Int] = []
    var forUploadUsefulInfo: [Int] = []
    var subwayIntArray: [Int] = []
    
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
        NotificationCenter.default.addObserver(self, selector: #selector(keywordSendedIndex(_:)), name: .homeModalKeywordNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(usefulSendedIndex(_:)), name: .homeModalUsefulNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeTextviewState(_:)), name: .homeWriteTextViewisEditingNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setPhotoArray(_:)), name: .homeSendPhotoNotification, object: nil)
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
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightButton.setTitleColor(.blueGray80, for: .disabled)
        rightButton.setTitleColor(.warmPink, for: .normal)
        rightButton.addTarget(self, action: #selector(tapDoneButtonAction), for: .touchUpInside)
        
        let rightnavigationButton = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightnavigationButton
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func alertaction() {
        let alert = UIAlertController(title: "Your Title", message: "Your Message", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.postAction()
        }
        let cancel = UIAlertAction(title: "cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func postAction() {
        guard let address = placeSearchData.placeAddress else { return }
        guard let roadAddress = placeSearchData.placeRoadAddress else { return }
        guard let mapX = placeSearchData.placeMapX else { return }
        guard let mapY = placeSearchData.placeMapY else { return }
        guard let categoryIndex = CategoryIndex(rawValue: "\(classifyBadge)")?.index else { return }
        forUploadUsefulInfo = []
        forUploadKeyword = []
        
        storageKeywordData.forEach({
            guard let keyword = $0.tagIdx else { return }
            forUploadKeyword.append(keyword)
        })
        
        
        storageUsefulKeywordData.forEach({
            guard let useful = $0.tagIdx else { return }
            forUploadUsefulInfo.append(useful)
        })
        
        print(address, roadAddress, mapX, mapY, categoryIndex, forUploadKeyword, forUploadUsefulInfo)
        
        UploadServices.uploadServices.upload(
            imageArray: photoArray,
            title: articleTitle,
            adress: address,
            roadAddress: roadAddress,
            mapX: Int(mapX) ?? 0,
            mapY: Int(mapY) ?? 0,
            placeReview: "123",
            categoryIndex: categoryIndex,
            groupIdx: 1,
            tags: forUploadKeyword,
            infotags: forUploadUsefulInfo,
            subwayIdx: subwayIntArray) { networkResult in
                switch networkResult {
                case .success:
                    print("received PhotoArray : \(self.photoArray)")
                case .requestErr(let message):
                    print(message)
                case .pathErr: print("path")
                case .serverErr: print("serverErr")
                case .networkFail: print("networkFail")
                }
        }
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
        if storageKeywordData.count == 0 {
            return CGFloat(60)
        } else {
            return CGFloat(90)
        }
    }
    
    func returnUsefulInfoDynamicHeight() -> CGFloat {
        if storageUsefulKeywordData.count == 0 {
            return CGFloat(60)
        } else {
            return CGFloat(90)
        }
    }
}

//MARK: - @objc, notification
extension ArticleUploadVC {
    
    @objc private func dismissVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func setPhotoArray(_ notification: NSNotification) {
        guard let injectedModel = notification.userInfo?["photo"] as? [UIImage]  else {
            return
        }
        photoArray = injectedModel
        print(photoArray)
    }
    
    @objc private func keywordSendedIndex(_ notification: NSNotification) {
        storageKeywordData = []
        guard let injectedModel = notification.userInfo?["indexPath.item"] as? [Int] else {
            return
        }
        
        keywordData.enumerated().forEach({
            guard let index = $1.tagIdx else { return }
            for i in 0..<injectedModel.count {
                if injectedModel[i] == index {
                    storageKeywordData.append(keywordData[$0])
                }
            }
        })
        print("storageKeywordData : \(storageKeywordData)\n")
        collectionView.reloadData()
    }
    
    @objc private func usefulSendedIndex(_ notification: NSNotification) {
        storageUsefulKeywordData = []
        guard let injectedModel = notification.userInfo?["indexPath.item"] as? [Int] else {
            return
        }

        usefulKeywordData.enumerated().forEach({
            guard let index = $1.tagIdx else { return }
            for i in 0..<injectedModel.count {
                if injectedModel[i] == index {
                    storageUsefulKeywordData.append(usefulKeywordData[$0])
                }
            }
        })
        print("storageUsefulKeywㄷordData: \(storageUsefulKeywordData)\n")
        collectionView.reloadData()
    }
    
    @objc private func changeDefaultCellHeight(_ notification: NSNotification) {
        guard let injectedModel = notification.userInfo?["model"] as? [SubwayData] else { return }
        nearstationData = injectedModel
        nearstationData.forEach({
            subwayIntArray.append($0.subwayIdx!)
        })
        
        collectionView.reloadData()
    }
    
    @objc private func changeTextviewState(_ notification: NSNotification) {
        
        guard let injectedModel = notification.userInfo?["editingflag"] as? Bool else { return }
        print(injectedModel)
        if injectedModel == true {
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @objc private func tapDoneButtonAction() {
        alertaction()
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
            let marginConstant: CGFloat = 100 // Keyboard 칠 공간이 없어욥
            return CGSize(width: width, height: 452 + marginConstant)
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
                cell.stackView.isHidden = true
            } else if nearstationData.count == 1 {
                cell.stackView.isHidden = false
                cell.textFieldArray[1].isHidden = true
                cell.textFieldArray[2].isHidden = true
            } else if nearstationData.count == 2 {
                cell.stackView.isHidden = false
                cell.textFieldArray[2].isHidden = true
                
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
            cell.keywordTextFieldArray.forEach({
                $0.isHidden = false
            })
            if storageKeywordData.count == 0 {
                cell.keywordStackView.isHidden = true
            } else if storageKeywordData.count == 1 {
                cell.keywordStackView.isHidden = false
                cell.keywordTextFieldArray[1].isHidden = true
                cell.keywordTextFieldArray[2].isHidden = true
            } else if storageKeywordData.count == 2 {
                cell.keywordStackView.isHidden = false
                cell.keywordTextFieldArray[2].isHidden = true
            } else {
                cell.keywordStackView.isHidden = false
            }
            for i in 0..<storageKeywordData.count {
                cell.keywordTextFieldArray[i].text = storageKeywordData[i].tagName
            }
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsefulInformationCVC", for: indexPath) as? UsefulInformationCVC else {
                return UICollectionViewCell()
            }
            cell.usefulTextFieldarray.forEach({
                $0.isHidden = false
            })
            
            if storageUsefulKeywordData.count == 0 {
                cell.usefulStackView.isHidden = true
            } else if storageUsefulKeywordData.count == 1 {
                cell.usefulStackView.isHidden = false
                cell.usefulTextFieldarray[1].isHidden = true
                cell.usefulTextFieldarray[2].isHidden = true
            } else if storageUsefulKeywordData.count == 2 {
                cell.usefulStackView.isHidden = false
                cell.usefulTextFieldarray[2].isHidden = true
            } else {
                cell.usefulStackView.isHidden = false
            }
            for i in 0..<storageUsefulKeywordData.count {
                cell.usefulTextFieldarray[i].text = storageUsefulKeywordData[i].tagName
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
        if indexPath.section == 1 {
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
}
