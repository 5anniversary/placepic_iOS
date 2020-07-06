//
//  GroupListVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class GroupListVC: UIViewController {

    @IBOutlet weak var GroupListTV: UITableView!
    @IBOutlet weak var GroupWaitingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GroupListTV.delegate = self
        GroupListTV.dataSource = self
        GroupWaitingButtonLooksLike()
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    

  

}


extension GroupListVC{
    private func GroupWaitingButtonLooksLike(){
       
        GroupWaitingButton.backgroundColor = .white
        GroupWaitingButton.layer.backgroundColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1).cgColor
        GroupWaitingButton.layer.cornerRadius = 8
    }
    
    private func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.white
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
//        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "icMenuHamburg"),
//                                                          style: .plain,
//                                                          target: self,
//                                                          action: #selector(showSideMenuBar))
//        navigationItem.leftBarButtonItem = leftButton
    }
}








extension GroupListVC: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
//
//        let headerLabel = UILabel()
//        let numberOfFriendLabel = UILabel()
//
//        headerLabel.text = "친구 "
//        headerLabel.font = UIFont.systemFont(ofSize: 12)
//        headerLabel.frame = CGRect.init(x: 15, y: 0, width: 50, height: 30)
//
//        numberOfFriendLabel.text = "\(dataInformations.count-1)"
//        numberOfFriendLabel.font = UIFont.systemFont(ofSize: 12)
//        numberOfFriendLabel.frame = CGRect.init(x: 40, y: 0, width: 50, height: 30)
//
//        view.addSubview(headerLabel)
//        view.addSubview(numberOfFriendLabel)
//
//        return view
//    }
    
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//              if editingStyle == .delete {
//                  dataInformations.remove(at: indexPath.row)
//                  tableView.deleteRows(at: [indexPath], with: .fade)
//              } else if editingStyle == .insert {
//                  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//              }
//          }
    
}

extension GroupListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
      
          return 2
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 5 // data count

      }
//    cell.imageView.contentMode = UIViewContentMode.scaleAspectFit
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "GroupListTVC", for:
            indexPath) as? GroupListTVC else { return UITableViewCell() }
           
//            TableViewCell.setDataInformation(profileImageName: myProfile[0].photo, name: myProfile[0].name, status: myProfile[0].status)

        
//            TableViewCell.profileImage.layer.cornerRadius = TableViewCell.profileImage.frame.height/2
//            TableViewCell.GLProfileImageview.layer.cornerRadius = 50/2
//            TableViewCell.GLProfileImageview.topAnchor.constraint(equalTo: TableViewCell.topAnchor, constant: 13).isActive = true
//            TableViewCell.GLProfileImageview.leadingAnchor.constraint(equalTo: TableViewCell.leadingAnchor, constant: 16).isActive = true
//            TableViewCell.GLProfileImageview.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            TableViewCell.GLProfileImageview.widthAnchor.constraint(equalToConstant: 50).isActive = true

//            TableViewCell.profileImage.contentMode = .scaleAspectFill
//            TableViewCell.profileImage.layer.cornerRadius = 20 //half of your width or height

//
            return TableViewCell
    
        
    }
}


