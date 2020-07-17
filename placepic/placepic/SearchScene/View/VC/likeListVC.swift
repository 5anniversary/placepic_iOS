//
//  likeListVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/17.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Alamofire

class likeListVC: UIViewController {

    var placeindex:Int = 0
    @IBOutlet weak var likeList: UITableView!
    var peopleList:[likeListInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getlistData()
        
        likeList.delegate = self
        likeList.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    
    func getlistData(){
        likeListService.shared.getlist("\(placeindex)"){ networkResult in
            switch networkResult {
            case .success(let list):
                guard let people = list as? [likeListInfo] else { return }
                for i in 0..<people.count{
                    self.peopleList.append(people[i])
                }
                print(people)
                self.likeList.reloadData()
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "조회 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr:
                print("pathErr")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
                
            }
        }
    }
    

}

extension likeListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if peopleList.count == 0 {
            return 1
        }
        else{
            return peopleList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let likeListCell = tableView.dequeueReusableCell(withIdentifier: likeListTVC.identifier, for: indexPath) as? likeListTVC else { return UITableViewCell() }
        
        likeListCell.setListInfo(likeImg: peopleList[indexPath.row].profileImageURL, likeName: peopleList[indexPath.row].userName, likePart: peopleList[indexPath.row].part, likeDate: peopleList[indexPath.row].likeCreatedAt)
        
        return likeListCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
