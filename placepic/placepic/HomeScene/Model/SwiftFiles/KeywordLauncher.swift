//
//  SettingLauncher.swift
//  SemiViewPagerTest
//
//  Created by elesahich on 2020/04/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class KeywordLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var homeController: HomeVC?
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // 빈 CollectionView 선언, 있다가 CellSize를 부여할 것
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    var keyword: [String] = [
        "abcd",
        "abcdabcd",
        "abcdabcdabcd",
        "abcdabcdabcdabcd",
        "abcdabcdabcdabcdabcd",
        "abcdabcdabcabcd",
        "abbcdabcd",
        "abcdabdabcdabcdabcd",
        "abcdabcabcdabcd",
        "abcdabcdababcdabcdabcd"
    ]
    
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    
    private func calculateHeight() -> CGFloat {
        /// 2 + (셀 넓이가 좀 문제야 로직을 잘 모르겟음 padding 양쪽 10씩 20 + Itemspacing (10)
        
        let width = UIScreen.main.bounds.width - 20
        let height: CGFloat = 50
        let itemspacing: CGFloat = 10
        
        var floor: CGFloat = 1
        var heightTemp: CGFloat = 0
        
        keyword.forEach {
            heightTemp += $0.width(withConstrainedHeight: 40, font: .systemFont(ofSize: 16)) + itemspacing + 2 + 20
            print("heightTemp: \(heightTemp)")
            print("floor: \(floor)")
            
            if width < heightTemp {
                print("heightTemp : \(heightTemp)")
                floor += 1
                heightTemp = 0
            }
        }
        
        print("view Height : \(height*floor)")
        return height * (floor+2)
    }
    
    func showSettings() {
        print(#function)
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            collectionView.clipsToBounds = true
            collectionView.layer.cornerRadius = 10
            collectionView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let height: CGFloat = calculateHeight()
            let y = window.frame.height - height
            //  y : collectionView가 그려지는 시작 위치
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x:0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
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
                                                   height: self.collectionView.frame.height
                )}
        }, completion: nil
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
//        handleDismiss()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyword.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeywordCell
        cell.nameLabel.text = keyword[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let width: CGFloat = keyword[indexPath.item].width(withConstrainedHeight: 40, font: .systemFont(ofSize: 16))
        let height: CGFloat = 40
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    override init() {
        super.init()
        
        collectionView.collectionViewLayout = CenterAlignedCollectionViewFlowLayout()
//        collectionView.collectionViewLayout = LeftAlignCollectionViewFlowLayout()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(KeywordCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}








