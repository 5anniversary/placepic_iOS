//
//  ViewController.swift
//  placepic
//
//  Created by elesahich on 2020/06/29.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class RankVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var rankData: [RankData] = []
    var rankLargeData: RankDataClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultRequest()
        setTableViewDelegate()
        setNavigationBar()
    }
}

//MARK: - 통신
extension RankVC {
    
    func setDefaultRequest() {
        print(#function)

        RankServices.rankServices.getRankData { data in
            if let metaData = data {
                print(metaData)
                self.rankLargeData = metaData
                guard let datum = self.rankLargeData?.userList else { return }
                self.rankData = datum
                self.tableView.reloadData()
            }
        }
    }
}

extension RankVC {
    
    func setNavigationBar() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let leftLabel = UILabel()
        leftLabel.text = "친구"
        leftLabel.font = UIFont.boldSystemFont(ofSize: 22)
        leftLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: leftLabel)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc func dismissVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "RankTVC", bundle: nil), forCellReuseIdentifier: "RankTVCIdentifier")
    }
}

extension RankVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension RankVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RankTVCIdentifer") as? RankTVC else {
            return UITableViewCell()
        }
        
        cell.model = rankData[indexPath.row]
        return cell
    }
}
