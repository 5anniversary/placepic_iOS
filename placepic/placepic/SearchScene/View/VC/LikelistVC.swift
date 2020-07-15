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
        guard let placeListCell = tableView.dequeueReusableCell(withIdentifier: PlaceListTVC.identifier, for: indexPath) as? PlaceListTVC else { return UITableViewCell() }

        return placeListCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
