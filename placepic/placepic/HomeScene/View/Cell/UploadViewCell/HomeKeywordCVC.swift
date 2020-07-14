//
//  KeywordCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HomeKeywordCVC: UICollectionViewCell {
    
    @IBOutlet weak var keywordTitleLabel: UILabel!
    @IBOutlet weak var innerCollectionView: UICollectionView!
    
    var keywordArray: [KeywordData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTextfield()
        setCollectionView()
        innerCollectionView.collectionViewLayout = CenterAlignedCollectionViewFlowLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension HomeKeywordCVC {

    private func configureTextfield() {
        keywordTitleLabel.font = Font.boldFontSize15
        keywordTitleLabel.textColor = UIColor.gray90
        
    }
    
    private func setCollectionView() {
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self
    }
}

extension HomeKeywordCVC: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let height: CGFloat = 23
    
        return CGSize(width: width, height: height)
    }
}
extension HomeKeywordCVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywordArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerKeywordCVC", for: indexPath) as? InnerKeywordCVC else {
            return UICollectionViewCell()
        }
        cell.model = keywordArray[indexPath.item]
        return cell
    }
}

