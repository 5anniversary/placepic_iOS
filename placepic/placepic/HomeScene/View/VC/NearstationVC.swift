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
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    /// 서버에서 역이 Static으로 주입되는 모델
    var stationModel: [StationModel] = [
        StationModel(station: "오이도역", lineArray: [4]),
        StationModel(station: "사당역", lineArray: [2, 4]),
        StationModel(station: "동대문문화역사공원역", lineArray: [2, 4, 5])
    ]
    
    /// `TableView에 나오는 Model`
    var searchTemporaryModel: [StationModel] = []
    /// `CollectionView에 나오는 모델`
    var collectionViewModel: [StationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setNavigationBar()
        setTextfield()
        setSearchbarHeight()
        setTableView()
    }
}

extension NearstationVC {
    
    private func setTextfield() {
        searchTextField.addTarget(self, action: #selector(textFieldDidChage(_:)), for: .editingChanged)
        searchTextField.backgroundColor = UIColor.blueGray20
        searchTextField.layer.cornerRadius = 6
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.white.cgColor
        searchTextField.clipsToBounds = true
        searchTextField.setLeftPaddingPoints(30)
        searchTextField.placeholder = "가까운 지하철 역을 검색해보세요"
    }
    
    @objc private func textFieldDidChage(_ textField: UITextField) {
        
        if searchTextField.text == "" {
            searchTemporaryModel.removeAll()
            self.tableView.reloadData()
        }
        
        func filterContentForSearchText(searchText: String) {
            for i in 0..<stationModel.count {
                if stationModel[i].station.contains(searchText) {
                    let model = stationModel[i]
                    searchTemporaryModel.append(model)
//                    print("before searchTemporaryModel: \(searchTemporaryModel[i])\n")
                    let set = Set(searchTemporaryModel)
                    searchTemporaryModel = Array(set)
//                    print("after searchTemporaryModel: \(searchTemporaryModel[i])\n")
                }
            }
        }
        let searchText = searchTextField.text ?? ""
        filterContentForSearchText(searchText: searchText)
        tableView.reloadData()
    }
    
    /// Model에 데이터가 없으면 0 있으면 1
    /// reload 해줘야하고
    /// tableViewCell이 눌리는 경우마다 발생해야 함 ( default : Hide)
    private func setSearchbarHeight() {
        if collectionViewModel.count == 0 {
            collectionView.isHidden = true
            stackviewHeight.constant = 53
        } else {
            self.collectionView.isHidden = false
            stackviewHeight.constant = 53
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                            self.stackviewHeight.constant = 106
            }, completion: nil)
        }
    }
    
    private func setTableView() {
        tableView.register(UINib.init(nibName: "ShowStationTVC", bundle: nil), forCellReuseIdentifier: "ShowStationTVCIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
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
    
    /// `컬렉션뷰 : 테이블뷰 눌렀을 때 가져다가 붙으면 됨`
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /// `@ sizethatFits라는 메소드 있으니 사용해봅시다 @`
        let widthexceptlabel: CGFloat = 38
        let cellwidth: CGFloat = collectionViewModel[indexPath.item].station.width(withConstrainedHeight: 30, font: .systemFont(ofSize: 13)) + widthexceptlabel
        let height: CGFloat = 30
        
        return CGSize(width: cellwidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearstationCVCIdentifier", for: indexPath) as? NearstationCVC else {
            return UICollectionViewCell()
        }
        setSearchbarHeight()
        cell.model = collectionViewModel[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 15, bottom: 0, right: 15)
    }
}

extension NearstationVC: UITableViewDelegate { }
extension NearstationVC: UITableViewDataSource {
    
    /// `테이블 뷰 : 데이터에 누구가 뭐가 있을수 있잖아요`
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// 같은 model을 참조하면 index로 해도 됩니다
        
        print("selectTempModel: \(searchTemporaryModel[indexPath.row])")
        
        collectionViewModel.append(searchTemporaryModel[indexPath.row])
        let set = Set(collectionViewModel)
        collectionViewModel = Array(set)
        
        collectionView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchTemporaryModel.count == 0 {
            return 0
        } else {
            return searchTemporaryModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowStationTVCIdentifier", for: indexPath) as? ShowStationTVC else {
            return UITableViewCell()
        }
        
        if searchTemporaryModel.count == 0 {
            cell.model = stationModel[indexPath.row]
            return cell
        } else {
            cell.model = searchTemporaryModel[indexPath.row]
            print("searchTemModel: \(searchTemporaryModel[indexPath.row])")
            return cell
        }
    }
}
