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
    
    override var isSelected: Bool {
        didSet {
            contentView.layer.borderColor = isSelected ? UIColor.warmPink.cgColor : UIColor.blueGray30.cgColor
            contentView.layer.borderWidth = 2
            nameLabel.textColor = isSelected ? UIColor.warmPink : UIColor.blueGray80

        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            contentView.layer.borderColor = isHighlighted ? UIColor.warmPink.cgColor : UIColor.blueGray30.cgColor
            contentView.layer.borderWidth = 2
            nameLabel.textColor = isHighlighted ? UIColor.warmPink : UIColor.blueGray80
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = UIColor.blueGray30.cgColor
        contentView.layer.borderWidth = 2
        
        addSubview(nameLabel)
        nameLabel.textColor = UIColor.blueGray80
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
