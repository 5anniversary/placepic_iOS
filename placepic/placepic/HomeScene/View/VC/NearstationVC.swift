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
    
    var stationModel: [StationModel] = [
        StationModel(station: "오이도역", lineArray: [4]),
        StationModel(station: "사당역", lineArray: [2, 4]),
        StationModel(station: "동대문문화역사공원역", lineArray: [2, 4, 5])
    ]
    var searchTemporaryModel: [StationModel] = []
    var collectionViewModel: [StationModel] = []
    
    var stationArray: [String] = []
    
    /// stationModel에 역 주입이 되어야 함, Max 3개
    /// 해야할 일 :     Cell (CollectionViewCell) 생성
    /// 호선 한개만 뜨는 것
        
    func subtractStation() {
        stationModel.forEach({
            stationArray.append($0.station)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setNavigationBar()
        setTextfield()
        setSearchbarHeight()
        setTableView()
        subtractStation()
    }
}

extension NearstationVC {
    
    private func setTextfield() {
        searchTextField.addTarget(self, action: #selector(textFieldDidChage(_:)), for: .editingChanged)
        searchTextField.backgroundColor = UIColor.black20
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

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            })
        }
        func filterContentForSearchText(searchText: String) {
            for i in 0..<stationModel.count {
                if stationModel[i].station.contains(searchText) {
                    let model = stationModel[i]
                    searchTemporaryModel.append(model)
                    let set = Set(searchTemporaryModel)
                    searchTemporaryModel = Array(set)
                }
            }
        }
        let searchText = searchTextField.text ?? ""
        filterContentForSearchText(searchText: searchText)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.tableView.reloadData()
        })
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
        let cellwidth: CGFloat = stationModel[indexPath.item].station.width(withConstrainedHeight: 30, font: .systemFont(ofSize: 13)) + widthexceptlabel
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

        
        let set = Set(searchTemporaryModel)
        searchTemporaryModel = Array(set)
        collectionViewModel.append(searchTemporaryModel[indexPath.row])
        
        collectionView.reloadData()
        print(collectionViewModel)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
            print(#function)
            print(searchTemporaryModel[indexPath.row])
            return cell
        }
    }
}


//class CustomTextField: UITextField {
//    deinit {
//        self.removeTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
//    }
//
//    private var workItem: DispatchWorkItem?
//    private var delay: Double = 0
//    private var callback: ((String?) -> Void)? = nil
//
//    func debounce(delay: Double, callback: @escaping ((String?) -> Void)) {
//        self.delay = delay
//        self.callback = callback
//        DispatchQueue.main.async {
//            self.callback?(self.text)
//        }
//        self.addTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
//    }
//
//    @objc private func editingChanged(_ sender: UITextField) {
//        self.workItem?.cancel()
//        let workItem = DispatchWorkItem(block: { [weak self] in
//            self?.callback?(sender.text)
//        })
//        self.workItem = workItem
//        DispatchQueue.main.asyncAfter(deadline: .now() + self.delay, execute: workItem)
//    }
//}
