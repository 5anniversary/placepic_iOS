//
//  AdminVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/06.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class AdminVC: UIViewController {

    @IBOutlet var PeopleList: UITableView!
    var adminList:[WaitUserModel] = []
    var frame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavi()
        PeopleList.delegate = self
        PeopleList.dataSource = self
        getData()
        
        self.tabBarController?.tabBar.isHidden = true

        // Do any additional setup after loading the view.
        
        //dismiss될때
        // tabBarController?.tabBar.isHidden = false
    }
    
    func getData(){
        adminService.shared.getAdminUser() { networkResult in
            switch networkResult {
            case .success(let products):
                guard let users = products as? [WaitUserModel] else { return }
                print(users.count)
                for i in 0..<users.count{
                    self.adminList.append(users[i])
                }
                self.PeopleList.reloadData()
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "조회 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
                
            }
        }
    }
    
    private func setNavi() {
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
        navigationItem.title = "승인대기"
    }
    
    @objc func dismissVC() {
        navigationController?.popViewController(animated: true)
        
        let transform = CGAffineTransform(translationX: 0, y: 100)
        self.tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.transform = transform
                
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.tabBarController?.tabBar.transform = .identity
                        
        }, completion: nil)
    }
      
    
//    func setPeople(){
//        let person = adminListModel(name: "배민주", birth: "1997.10.04", part: "디자인", phone: "010-0000-0000", gender: "여")
//
//        adminLists = [person]
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailView" {
            if let destination = segue.destination as? PeopleDetailVC {
                if let selectedIndex = self.PeopleList.indexPathsForSelectedRows?.first?.row {
                    let data = adminList[selectedIndex]
                    destination.selectedData = data
                }
            }
        }
    }
}

extension AdminVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adminList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let peopleListCell = tableView.dequeueReusableCell(withIdentifier: "PeopleListCell", for: indexPath)
        peopleListCell.textLabel?.text = adminList[indexPath.row].userName
        peopleListCell.detailTextLabel?.text = adminList[indexPath.row].part
            
        return peopleListCell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

}
