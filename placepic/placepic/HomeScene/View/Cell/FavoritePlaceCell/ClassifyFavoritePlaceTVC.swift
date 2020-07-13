//
//  ClassifyFavoritePlaceTVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/13.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class ClassifyFavoritePlaceTVC: UITableViewCell {

    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
        configureCell()
    }
    
    func configureCell() {
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textColor = .gray90
        
    }

    var model: ClassifyModel? {
        didSet {
            favoriteImage.image = model?.image
            titleLabel.text = model?.title
        }
    }
}

struct ClassifyModel {
    let image: UIImage?
    let title: String?
}
