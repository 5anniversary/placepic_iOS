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
    
    private func registerCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func getImageArray() {
        /// 이거 모르겠다 어쨌든 VC에서 띄워야하는거고 Present는
        
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            var config = YPImagePickerConfiguration()
            config.showsCrop = .rectangle(ratio: (1/1))
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
            window.rootViewController?.present(picker, animated: true, completion: nil)
        }
    }
}

extension OutterUploadPhotoCVC: UICollectionViewDelegateFlowLayout { }
extension OutterUploadPhotoCVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photoArray.count == 0 {
            return 1
        }
        else {
            return photoArray.count + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerUploadPhotoCVC", for: indexPath) as? InnerUploadPhotoCVC else {
            return UICollectionViewCell()
        }
        
        if photoArray.count == 0 {
            return cell
        } else {
            cell.imageView.image = photoArray[indexPath.item]
            return cell
        }
        
        /// Index가 한개씩 밀렸으면 좋겠다
        /// 1 << 0
        /// 2 << 1

//        print(photoArray.count)
//        if photoArray.count == 0 || indexPath.item == 0 {
//            return cell
//        } else if indexPath.item > 0 {
//            cell.imageView.image = photoArray[indexPath.item]
//            return cell
//        }
//        return cell

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
