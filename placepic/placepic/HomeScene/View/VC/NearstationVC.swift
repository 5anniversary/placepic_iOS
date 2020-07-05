//
//  NearstationVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/05.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class NearstationVC: UIViewController {

    @IBOutlet weak var stackviewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var stationModel: [String] = []
    /// stationModel에 역 주입이 되어야 함
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
    }
}

extension NearstationVC {
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension NearstationVC: UICollectionViewDelegateFlowLayout { }
extension NearstationVC: UICollectionViewDataSource {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stationModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearstationCVCIdentifier", for: indexPath) as? NearstationCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
