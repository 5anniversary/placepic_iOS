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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: CustomTextField!
    @IBOutlet weak var tableView: UITableView!
//    let textField: CustomTextField = {
//        let txtfield = CustomTextField()
//
//        return txtfield
//    }()
//
    var stationModel: [String] = []
    
    /// stationModel에 역 주입이 되어야 함
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setNavigationBar()
        setSearchbarHeight()
    }
}

extension NearstationVC {
    
    /// Model에 데이터가 없으면 0 있으면 1
    /// reload 해줘야하고
    /// tableViewCell이 눌리는 경우마다 발생해야 함 ( default : Hide)
    private func setSearchbarHeight() {
       
//        searchTextField.debounce(delay: 0.3) { (text) in
//            print(text)
//        }
        
        if stationModel.count == 0 {
            collectionView.isHidden = true
            stackviewHeight.constant = 53
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                            self.collectionView.isHidden = false
                            self.stackviewHeight.constant = 106
            }, completion: nil)
        }
    }
    
    private func setCollectionView() {
        collectionView.register(UINib.init(nibName: "NearstationCVC", bundle: nil), forCellWithReuseIdentifier: "NearstationCVCIdentifier")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrowIc"),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc private func dismissVC() {
        navigationController?.popViewController(animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}

extension NearstationVC: UITableViewDelegate {
    
}

extension NearstationVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowStationTVCIdentifier", for: indexPath) as? ShowStationTVC else {
            return UITableViewCell()
        }
        
        return cell
    }
}

class CustomTextField: UITextField {

    deinit {
        self.removeTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
    }

    private var workItem: DispatchWorkItem?
    private var delay: Double = 0
    private var callback: ((String?) -> Void)? = nil

    func debounce(delay: Double, callback: @escaping ((String?) -> Void)) {
        self.delay = delay
        self.callback = callback
        DispatchQueue.main.async {
            self.callback?(self.text)
        }
        self.addTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
    }

    @objc private func editingChanged(_ sender: UITextField) {
      self.workItem?.cancel()
      let workItem = DispatchWorkItem(block: { [weak self] in
          self?.callback?(sender.text)
      })
      self.workItem = workItem
      DispatchQueue.main.asyncAfter(deadline: .now() + self.delay, execute: workItem)
    }
}
