//
//  RankTVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/16.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Kingfisher

class RankTVC: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    @IBOutlet weak var articleCountLabel: UILabel!
    @IBOutlet weak var writtenArticleLabel: UILabel!
    
    // 사진을 넣을 것이닷
    var model: RankData? {
        didSet {
            guard let articleCount = model?.postCount else { return }
            guard let rank = model?.rank else { return }
            guard let imageURL = model?.profileImageURL else { return }
            
            
            profileImage.kf.setImage(with: URL(string: imageURL))
            rankLabel.text = model?.rank == -1 ? "-" : "\(String(describing: rank))"
            nameLabel.text = model?.userName
            affiliationLabel.text = model?.part
            articleCountLabel.text = String(describing: articleCount)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureRankSceneUI()
    }
}

extension RankTVC {
    
    func configureRankSceneUI() {
        rankLabel.font = Font.boldFontSize14
        rankLabel.textColor = UIColor.gray60 // 123이면 warmPink 아니면 gray60
        affiliationLabel.font = Font.fontSize12
        affiliationLabel.textColor = UIColor.blueGray40
        nameLabel.font = Font.boldFontSize15
        nameLabel.textColor = UIColor.gray90
        articleCountLabel.font = Font.boldFontSize15
        articleCountLabel.textColor = UIColor.gray60
        writtenArticleLabel.font = Font.fontSize11
        writtenArticleLabel.textColor = UIColor.gray60
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }
}


