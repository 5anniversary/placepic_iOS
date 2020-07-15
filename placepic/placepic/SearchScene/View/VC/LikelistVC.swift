//
//  LikelistVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/15.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class LikelistVC: UIViewController {

    var likeList:[Uploader] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension LikelistVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let placeListCell = tableView.dequeueReusableCell(withIdentifier: likeListTVC.identifier, for: indexPath) as? likeListTVC else { return UITableViewCell() }

        placeListCell.setLikeList(lname: likeList[indexPath.row].userName, lpart: likeList[indexPath.row].part, ldate: "", limg: "")
        print(placeListCell)
        return placeListCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
