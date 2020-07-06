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
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setNavi()
            PeopleList.delegate = self
            PeopleList.dataSource = self
            // Do any additional setup after loading the view.
        }
        func setNavi(){
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            
        }
    }

    extension AdminVC: UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let peopleListCell = tableView.dequeueReusableCell(withIdentifier: "PeopleListCell", for: indexPath)
            peopleListCell.textLabel?.text = "조희연"
            peopleListCell.detailTextLabel?.text = "22세 여"
            
            return peopleListCell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 72
        }

}
