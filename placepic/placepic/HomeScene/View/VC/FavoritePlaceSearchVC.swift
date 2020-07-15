//
//  HomeVC.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FavoritePlaceSearchVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var nullPageView: UIView!
    @IBOutlet weak var nullPageTitle: UILabel!
    
    var placeSearchData: [PlaceSearchData] = []
    var placeLargeData: DataClass?
    var classifyText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTextFields()
        configureTableView()
        configureNullPageView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let index = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: index, animated: true)
        }
    }
}

// MARK: - UI
extension FavoritePlaceSearchVC {
    
    private func configureNullPageView() {
        nullPageView.backgroundColor = UIColor.white
        nullPageTitle.font = .boldSystemFont(ofSize: 15)
        nullPageTitle.textColor = UIColor.blueGray30
        nullPageTitle.text = "등록하고 싶은 장소를 검색해보세요."
    }
    
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
        navigationItem.title = "최애장소 등록하기"
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - 통신
extension FavoritePlaceSearchVC {
    
    @objc private func setDefaultRequest() {
        /// `/search/place/" >>>>> +그룹인덱스+쿼리스트링 : 1?query=`
        ///`@@@@ group Index @@@@` 받아서 확인
        
        guard let searchText = searchTextField.text else { return }
        PlaceSearchServices.placeSearchServices.getplaceSearchList(1, searchText) { data in
            
            if let metaData = data {
                self.placeLargeData = metaData
                guard let datum = self.placeLargeData?.result else { return }
                self.placeSearchData = datum
                self.nullPageView.transform = .identity
                self.tableView.reloadData()
                UIView.animate(withDuration: 0.8,
                               delay: 0,
                               usingSpringWithDamping: 1,
                               initialSpringVelocity: 1,
                               options: .curveEaseOut,
                               animations: {
                                
                                self.nullPageView.transform = CGAffineTransform(translationX: 600, y: 0)
                },completion: { (_) in
                    self.nullPageView.alpha = 0
                })
            }
        }
    }
}

extension FavoritePlaceSearchVC: UITableViewDataSource {
    
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

extension FavoritePlaceSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let label = placeSearchData[indexPath.row].placeName else { return }
        guard let vc = storyboard?.instantiateViewController(identifier: "ArticleUploadVC") as? ArticleUploadVC else {
            return }
        guard let text = classifyText else { return }
        vc.classifyBadge = text
        vc.articleTitle = label
                
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 71
        return rowHeight
    }
}

extension FavoritePlaceSearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}




