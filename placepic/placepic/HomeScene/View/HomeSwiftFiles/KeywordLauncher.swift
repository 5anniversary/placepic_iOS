//
//  SettingLauncher.swift
//  SemiViewPagerTest
//
//  Created by elesahich on 2020/04/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class KeywordLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var homeController: FavoritePlaceSearchVC?
    var searchVC: SearchVC?
    var childVC: ChildVC?
    var uploadVC: ArticleUploadVC?
    
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.frame = CGRect.zero
        return view
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.frame = CGRect.init(x: 0, y: 0, width: 47, height: 22)
        return label
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.frame = CGRect.init(x: 110, y: 273, width: 120, height: 45)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor.blueGray20
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.frame = CGRect.init(x: 241, y: 273, width: 120, height: 45)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor.red
        return button
    }()
    
    var keyword: [KeywordData] = []
    var useful: [UsefulInformData] = []
    
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    
    private func calculateHeight() -> CGFloat {
        
        let width = UIScreen.main.bounds.width - 20
        let height: CGFloat = 50
        let itemspacing: CGFloat = 10
        
        var floor: CGFloat = 1
        var heightTemp: CGFloat = 0
        
        if keyword.count != 0 {
            keyword.forEach {
                guard let nameWidth = $0.tagName?.width(withConstrainedHeight: 50, font: .boldSystemFont(ofSize: 14)) else { return }
                heightTemp += nameWidth + itemspacing + 20
                
                //            print("heightTemp: \(heightTemp)")
                //            print("floor: \(floor)")
                
                if width < heightTemp {
                    //                print("heightTemp : \(heightTemp)")
                    floor += 1
                    heightTemp = 0
                }
            }
            //        print("view Height : \(height*floor)")
            return height * (floor+2)
        } else {
            useful.forEach {
                guard let nameWidth = $0.tagName?.width(withConstrainedHeight: 50, font: .systemFont(ofSize: 14)) else { return }
                heightTemp += nameWidth + itemspacing + 20
                // 계산을 잘 해서 381 잘 떴는데
                // 얘를 옆으로 넘기는 로직이 실패네
                
                print("heightTemp: \(heightTemp)")
                print("floor: \(floor)")
                
                if width < heightTemp {
                    //                print("heightTemp : \(heightTemp)")
                    floor += 1
                    heightTemp = 0
                }
            }
            //        print("view Height : \(height*floor)")
            return height * (floor+2)
        }
        /// 설명 : 마지막 층  + 1, 버튼 만들어놓을 친구들 층  + 1 + 키워드 라벨 층 ( 높이 지정 필요해욤 )
    }
    
    private func configureButton() {
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    func alertaction() {
        let alert = UIAlertController(title: "Your Title", message: "Your Message", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler : nil )
        let cancel = UIAlertAction(title: "cancel", style: .destructive, handler : nil)
        
        alert.addAction(cancel)
        alert.addAction(okAction)
        
        self.uploadVC?.present(alert, animated: true, completion: nil)
    }

    @objc private func doneButtonTapped() {
              
        guard let count = collectionView.indexPathsForSelectedItems?.count else { return }
        
        if count >= 4 {
            alertaction()
        } else {
            
            guard let index: [IndexPath] = collectionView.indexPathsForSelectedItems else { return }
            var sendIndex: [Int] = []
            
            for i in 0..<index.count {
                print(index[i][1])
                sendIndex.append(index[i][1])
            }
            
            if keyword.count != 0 {
                NotificationCenter.default.post(name: .homeModalKeywordNotification, object: nil, userInfo: ["indexPath.item": sendIndex])
            } else {
                NotificationCenter.default.post(name: .homeModalUsefulNotification, object: nil, userInfo: ["indexPath.item": sendIndex])
            }
            
            collectionView.reloadData()
            handleDismiss()
        }
    }
    
    /// 호출할때 여기다가 매개변수로 넘겨주는게 조을거같아욤
    func showSettings(_ titleLabel: String, _ model: [Any]) {
        if titleLabel == "키워드" {
            keyword = model as? [KeywordData] ?? []
        } else if titleLabel == "장소 정보" {
            useful = model as? [UsefulInformData] ?? []
        }
        
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            modalView.clipsToBounds = true
            modalView.layer.cornerRadius = 15
            modalView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
            mainLabel.text = titleLabel
            
            mainLabel.translatesAutoresizingMaskIntoConstraints = false
            doneButton.translatesAutoresizingMaskIntoConstraints = false
            cancelButton.translatesAutoresizingMaskIntoConstraints = false
            
            window.addSubview(blackView)
            window.addSubview(modalView)
            modalView.addSubview(mainLabel)
            modalView.addSubview(collectionView)
            collectionView.addSubview(doneButton)
            collectionView.addSubview(cancelButton)
            
            let constraints = [
                mainLabel.leadingAnchor.constraint(equalTo: self.modalView.leadingAnchor, constant: 14),
                mainLabel.topAnchor.constraint(equalTo: self.modalView.topAnchor, constant: 20),
                
                doneButton.trailingAnchor.constraint(equalTo: self.modalView.trailingAnchor, constant: -14),
                doneButton.bottomAnchor.constraint(equalTo: self.modalView.bottomAnchor, constant: -20),
                doneButton.widthAnchor.constraint(equalToConstant: 120),
                doneButton.heightAnchor.constraint(equalToConstant: 45),
                
                cancelButton.trailingAnchor.constraint(equalTo: self.doneButton.leadingAnchor, constant: -11),
                cancelButton.centerYAnchor.constraint(equalTo: doneButton.centerYAnchor, constant: 0),
                cancelButton.widthAnchor.constraint(equalToConstant: 120),
                cancelButton.heightAnchor.constraint(equalToConstant: 45)
            ]
            NSLayoutConstraint.activate(constraints)
            
            let height: CGFloat = calculateHeight()
            let modalViewHeight = height + 79
            
            //            let y = window.frame.height - height
            let modalY = window.frame.height - modalViewHeight
            
            /// y : collectionView가 그려지는 시작 위치
            modalView.frame = CGRect.init(x: 0, y: window.frame.height, width: window.frame.width, height: modalViewHeight)
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            blackView.frame = window.frame
            
            blackView.alpha = 0
            modalView.backgroundColor = UIColor.white
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                            
                            self.blackView.alpha = 1
                            self.modalView.frame = CGRect(x: 0, y: modalY, width: self.modalView.frame.width, height: self.modalView.frame.height)
                            self.collectionView.frame = CGRect(x:0, y: 79, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                            
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                self.collectionView.frame = CGRect(x: 0,
                                                   y: window.frame.height,
                                                   width: self.collectionView.frame.width,
                                                   height: self.collectionView.frame.height)
                self.modalView.frame = CGRect(x: 0,
                                              y: window.frame.height,
                                              width: self.modalView.frame.width,
                                              height: self.modalView.frame.height)
                self.keyword = []
                self.useful = []
            }
        }, completion: { (_) in
            self.modalView.removeFromSuperview()
            self.collectionView.reloadData()
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let count = collectionView.indexPathsForSelectedItems?.count else { return }
        print("count: \(count)")
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            if selectedItems.contains(indexPath) {
                collectionView.deselectItem(at: indexPath, animated: true)
                return false
            }
        }
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if keyword.count != 0 {
            return keyword.count
        } else {
            return useful.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeywordCell
        if keyword.count != 0 {
            cell.nameLabel.text = keyword[indexPath.item].tagName
        } else {
            cell.nameLabel.text = useful[indexPath.item].tagName
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if keyword.count != 0 {
            guard let wid = keyword[indexPath.item].tagName?.width(withConstrainedHeight: 40, font: .boldSystemFont(ofSize: 14)) else {
                return CGSize()
            }
            let width: CGFloat = wid + 20 // 20: 좌우 inset
            let height: CGFloat = 40
            
            return CGSize(width: width, height: height)
        } else {
            guard let wid = useful[indexPath.item].tagName?.width(withConstrainedHeight: 40, font: .boldSystemFont(ofSize: 14)) else {
                return CGSize()
            }
            let width: CGFloat = wid + 20 // 20: 좌우 inset
            let height: CGFloat = 40
            
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    override init() {
        super.init()
        
        configureButton()
        collectionView.allowsMultipleSelection = true
        collectionView.collectionViewLayout = CenterAlignedCollectionViewFlowLayout()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(KeywordCell.self, forCellWithReuseIdentifier: cellId)
    }
}








