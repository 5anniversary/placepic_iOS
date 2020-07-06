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
    var adminLists:[adminListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavi()
        PeopleList.delegate = self
        PeopleList.dataSource = self
        setPeople()
        
            // Do any additional setup after loading the view.
    }
    
    func setPeople(){
        let person = adminListModel(name: "배민주", birth: "1997.10.04", part: "디자인", phone: "010-0000-0000", gender: "여")
        
        adminLists = [person]
    }
    
    
    func setNavi(){
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailView" {
            if let destination = segue.destination as? PeopleDetailVC {
                if let selectedIndex = self.PeopleList.indexPathsForSelectedRows?.first?.row {
                    let data = adminLists[selectedIndex]
                    destination.selectedData = data
                }
            }
            
        }
    }
    
    
}

extension AdminVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adminLists.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let peopleListCell = tableView.dequeueReusableCell(withIdentifier: "PeopleListCell", for: indexPath)
        peopleListCell.textLabel?.text = adminLists[indexPath.row].name
        peopleListCell.detailTextLabel?.text = adminLists[indexPath.row].part
            
        return peopleListCell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

}
