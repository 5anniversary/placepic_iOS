//
//  SettingCell.swift
//  SemiViewPagerTest
//
//  Created by elesahich on 2020/04/11.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class KeywordCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = UIColor.black80.cgColor
        contentView.layer.borderWidth = 1
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
