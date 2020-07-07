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
    @IBOutlet weak var titleLabel: UILabel!
    
    var photoArray: [UIImage]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setNavigationBar()
    }
    
    @IBAction func testButtonAction(_ sender: Any) {
        var config = YPImagePickerConfiguration()
        config.showsCrop = .rectangle(ratio: (16/9))
        config.showsCrop = .rectangle(ratio: (1/1))
        config.showsPhotoFilters = false
        config.startOnScreen = .library
        config.screens = [.library]
        config.library.defaultMultipleSelection = true
        config.library.maxNumberOfItems = 10
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            self.photoArray = []
            
            if cancelled {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            // 여러 이미지를 넣어주기 위해 하나씩 넣어주는 반복문
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
   
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderReusableView", for: indexPath) as? NearstaionHeaderCVC
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadPhotoCVC", for: indexPath) as? UploadPhotoCVC else {
            return UICollectionViewCell()
        }
        
//        cell.uploadImageView.image = photoArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
