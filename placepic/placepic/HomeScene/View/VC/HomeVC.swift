//
//  ViewController.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let keywordLabel: [String] = [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setCollectionView()
    }
}

// MARK: - 
extension HomeVC {
    
        collectionView.register(UINib.init(nibName: "KeywordCVC", bundle: nil), forCellWithReuseIdentifier: "KeywordCVCIdentifier")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    private func setNavigationBar() {

        guard let navigationBar = self.navigationController?.navigationBar else { return }
               
               navigationBar.isTranslucent = true
               navigationBar.backgroundColor = UIColor.clear
               navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               navigationBar.shadowImage = UIImage()
               
               //          let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "icMenuHamburg"),
               //                                                            style: .plain,
               //                                                            target: self,
               //                                                            action: #selector(showSideMenuBar))
               //          navigationItem.leftBarButtonItem = leftButton
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = keywordLabel[indexPath.item].width(withConstrainedHeight: 40, font: .systemFont(ofSize: 16))
        let height: CGFloat = 40
        
        return CGSize(width: width + 20, height: height)
    }
}

extension HomeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywordLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeywordCVCIdentifier", for: indexPath)
            as? KeywordCVC else {
                return UICollectionViewCell()
        }
        cell.keywordLabel.text = keywordLabel[indexPath.item]
        return cell
    }
}

class LeftAlignCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + 10

            // 밑에 왜 안먹지
//            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }
        return attributes
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 4
    }
}

//MARK: - StackView

// 라벨 커스텀
class CategoryView: UILabel {
    
    //카테고리가 보여질 배경넓이 설정
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += 8
        contentSize.width += 8
        return contentSize
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        configure(text: text)
    }
    
    //라벨 속성 설정
    func configure(text: String) {
        
        self.backgroundColor = UIColor.mainBlue
        self.layer.cornerRadius = 3
        self.font = UIFont.systemFont(ofSize: 16)
        self.textColor = UIColor.black80
        self.text = text
        self.textAlignment = .center
    }
}

// 라벨이 들어갈 스텍뷰설정
class CategoryList: UIStackView {
    // 오토레이아웃 설정해주기
    override func addSubview(_ subview: UIView) {
        let contraintLast = self.subviews.last?.trailingAnchor ?? self.leadingAnchor
        super.addSubview(subview)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: contraintLast, constant: 4).isActive = true
    }
}
