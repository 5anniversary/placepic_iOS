//
//  uploadPhotoCVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/08.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class UploadPhotoCVC: UICollectionViewCell {
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
    }
    
}
