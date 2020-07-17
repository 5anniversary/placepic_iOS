//
//  OutterUploadCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import YPImagePicker

class OutterUploadPhotoCVC: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photoArray: [UIImage]! = []
    /// 항상얼웨이즈 index 0번째는 참조하면 안됨니당
    /// 이유 : `인덱스 0 번은 다른 친구다 임마`
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCollectionView()
    }
    
    func topViewController() -> UIViewController? {
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            if var viewController = window.rootViewController {
                while viewController.presentedViewController != nil {
                    viewController = viewController.presentedViewController!
                }
                print("topViewController -> \(String(describing: viewController))")
                return viewController
            }
        }
        return nil
    }
    
    private func registerCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func getImageArray() {
        if UIApplication.shared.windows.first(where: { $0.isKeyWindow }) != nil {
            
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
                    
                    guard let pictureArray = self.photoArray else { return }
                    NotificationCenter.default.post(name: .homeSendPhotoNotification, object: nil, userInfo: ["photo": pictureArray])
                }
            }
            topViewController()?.present(picker, animated: true, completion: nil)
        }
    }
    
//    private func getImageArray() {
//        var config = YPImagePickerConfiguration()
//        config.showsCrop = .rectangle(ratio: (9/16))
//        config.showsPhotoFilters = false
//        config.startOnScreen = .library
//        config.screens = [.library]
//        config.library.defaultMultipleSelection = true
//        config.library.maxNumberOfItems = 10
//
//        let picker = YPImagePicker(configuration: config)
//        photoArray = []
//
//        picker.didFinishPicking { [unowned picker] items, cancelled in
//            if cancelled {
//                picker.dismiss(animated: true, completion: nil)
//                return
//            }
//            for item in items {
//                switch item {
//                // 이미지만 받기때문에 photo case만 처리
//                case .photo(let p):
//                    // 이미지를 해당하는 이미지 배열에 넣어주는 code
//                    self.photoArray.append(p.image)
//                default:
//                    print("")
//                }
//            }
//            picker.dismiss(animated: true) {
//                // picker뷰 dismiss 할 때 이미지가 들어가 있는 collectionView reloadData()
//                self.collectionView.reloadData()
//            }
//        }
//        present(picker, animated: true, completion: nil)
//    }
}



extension OutterUploadPhotoCVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
extension OutterUploadPhotoCVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photoArray.count == 0 {
            return 1
        }
        else {
            return photoArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerUploadPhotoCVC", for: indexPath) as? InnerUploadPhotoCVC else {
            return UICollectionViewCell()
        }
        	
        if photoArray.count == 0 {
            cell.itemBackgroundView.backgroundColor = UIColor.blueGray10
            return cell
        } else {
            cell.itemBackgroundView.isHidden = true
            cell.imageView.image = photoArray[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            getImageArray()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 78, height: 78)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
