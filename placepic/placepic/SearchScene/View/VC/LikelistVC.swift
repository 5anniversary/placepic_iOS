//
//  LikelistVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/15.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Alamofire

class LikelistVC: UIViewController {

    @IBOutlet weak var likeListTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        likeListTV.delegate = self
        likeListTV.dataSource = self
        
        getdata()
//        print(likePeopleList)
        // Do any additional setup after loading the view.
    }

    func getdata(){
////        likeListService.shared.getPlaces(placeDetailVC.selectIdx){ networkResult in
////            switch networkResult {
////            case .success(let products):
////                guard let places = products as? placeListClass else { return }
////                for i in 0..<places.result.count{
////                    self.placeListData.append(places.result[i])
////                }
////                self.placeListTV.reloadData()
////                self.sumNum.text = "총 \(self.placeListData.count)개 결과"
////            case .requestErr(let message):
////                guard let message = message as? String else { return }
////                let alertViewController = UIAlertController(title: "조회 실패", message: message, preferredStyle: .alert)
////                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
////                alertViewController.addAction(action)
////                self.present(alertViewController, animated: true, completion: nil)
////            case .pathErr: print("pathErr")
////            case .serverErr: print("serverErr")
////            case .networkFail: print("networkFail")
//
//            }
//        }
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
