//
//  LikelistVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/15.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class LikelistVC: UIViewController {

//    var likePeopleList:[LikeList] = []
    @IBOutlet weak var likeListTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        likeListTV.delegate = self
        likeListTV.dataSource = self
        
//        print(likePeopleList)
        // Do any additional setup after loading the view.
    }

}

extension LikelistVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let peopleListCell = tableView.dequeueReusableCell(withIdentifier: likeListTVC.identifier, for: indexPath) as? likeListTVC else { return UITableViewCell() }

//        peopleListCell.setLikeList(lname: likePeopleList[indexPath.row].userName, lpart: likePeopleList[indexPath.row].part, ldate: "", limg: "")
//        
        return peopleListCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
