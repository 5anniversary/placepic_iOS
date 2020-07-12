//
//  HomeVC.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    var placeSearchData: [PlaceSearchData] = []
    var placeLargeData: DataClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        configureTableView()
        setTextFields()
    }
}

// MARK: -
extension HomeVC {
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self
    }
    
    private func setTextFields() {
        searchTextField.addTarget(self, action: #selector(setDefaultRequest), for: .editingDidEnd)
        searchTextField.backgroundColor = UIColor.blueGray20
        searchTextField.layer.cornerRadius = 6
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.white.cgColor
        searchTextField.clipsToBounds = true
        searchTextField.setLeftPaddingPoints(30)
        searchTextField.placeholder = "등록하고 싶은 장소를 검색해보세요."
        
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
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - 통신
extension HomeVC {
    
    @objc private func setDefaultRequest() {
        
/// `/search/place/" >>>>> +그룹인덱스+쿼리스트링 : 1?query=`
/// `group Index` 받아서 확인
        
        guard let searchText = searchTextField.text else { return }
        PlaceSearchServices.placeSearchServices.getplaceSearchList(1, searchText) { data in
               
            if let metaData = data {
                self.placeLargeData = metaData
                guard let datum = self.placeLargeData?.result else { return }
                self.placeSearchData = datum
                self.tableView.reloadData()
            }
        }
    }
}


extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeSearchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FindfavoritePlaceTVC") as? FindfavoritePlaceTVC else {
            return UITableViewCell()
        }
        cell.model = placeSearchData[indexPath.row]
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 105
        return rowHeight
    }
}

extension HomeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}




