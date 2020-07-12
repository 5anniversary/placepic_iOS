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
    var placeSearchData: [PlaceSearchData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        configureTableView()
        setDefaultRequest()
    }
}

// MARK: -
extension HomeVC {
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
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

//MARK: - 통신
extension HomeVC {
    
    private func setDefaultRequest() {

        //쿼리스트링
        PlaceSearchServices.placeSearchServices.getplaceSearchList("String") { data in
            if let metaData = data {
                self.placeSearchData = metaData
                print(metaData)
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
        let rowHeight: CGFloat = 71
        return rowHeight
    }
}




