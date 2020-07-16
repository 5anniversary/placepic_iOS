//
//  GroupPartiVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class GroupPartiVC: UIViewController {
    
    @IBOutlet weak var GroupPartiTV: UITableView!
    @IBOutlet weak var ButtonT: UIButton!

    
    private var dataInformations: [groupData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GroupPartiTV.delegate = self
        GroupPartiTV.dataSource = self
        getData()
        setbuttonlookslike()
        setNavi()
        
//
        // Do any additional setup after loading the view.
    }
    
    private func setNavi() { //타이틀이 가운데에 있는 네비
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
        navigationItem.title = "그룹신청"
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
    
    
    
    
}





extension GroupPartiVC: UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//        return 0
//    }
//
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

extension GroupPartiVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "SendVC") as? SendVC else { return }
        
//        vc.model = 
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataInformations.count// data count
        
    }
    //    cell.imageView.contentMode = UIViewContentMode.scaleAspectFit
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "GroupPartiTVC", for:
            indexPath) as? GroupPartiTVC else { return UITableViewCell() }
        
        //            TableViewCell.setDataInformation(profileImageName: myProfile[0].photo, name: myProfile[0].name, status: myProfile[0].status)
        
        
        //            TableViewCell.underBar.alpha = 0
        
        //(profileImageName: String, name: String, numofPeople:String, numofPost:String)
        print(dataInformations)
        TableViewCell.setDataInformation(profileImageName:dataInformations[indexPath.row].groupImage,
                                         name: dataInformations[indexPath.row].groupName,
                                         numofPeople: dataInformations[indexPath.row].userCount,
                                         numofPost: dataInformations[indexPath.row].postCount  )
//
        TableViewCell.image1.layer.cornerRadius = TableViewCell.image1.frame.height/2
//        //            TableViewCell.GLProfileImageview.layer.cornerRadius = 50/2
//        TableViewCell.GLProfileImageview.topAnchor.constraint(equalTo: TableViewCell.topAnchor, constant: 13).isActive = true
//        TableViewCell.GLProfileImageview.leadingAnchor.constraint(equalTo: TableViewCell.leadingAnchor, constant: 16).isActive = true
//        TableViewCell.GLProfileImageview.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        TableViewCell.GLProfileImageview.widthAnchor.constraint(equalToConstant: 50).isActive = true
//
//        TableViewCell.GLProfileImageview.contentMode = .scaleAspectFill
//        TableViewCell.GLProfileImageview.layer.cornerRadius = 20 //half of your width or height
//
        
        //(groupname:  signupemail, userCount: signuppw, postCount: signupname, groupImage:)
        
        
        return TableViewCell
        
        
    }
}

//(groupname:  signupemail, userCount: signuppw, postCount: signupname, groupImage:)








extension GroupPartiVC {
    
    func getData(){
        GroupPartiService.shared.grouplist { networkResult in
            switch networkResult {
                
            case .success(let products):
                print("안ㅇㅎㅎㅎㅎㅎㅎㅎ")
                
                guard let groups = products as? [groupData] else {return}
                print("dslk")
                for i in 0..<groups.count{
                    self.dataInformations.append(groups[i])
                    print ("dslk")
                }
                self.GroupPartiTV.reloadData()
                
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "nextNavi") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
                
            case .requestErr(let message):
                
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
                
            case .serverErr: print("serverErr")
                
            case .networkFail: print("networkFail")
                
            }
        }
    }
}




extension GroupPartiVC{
    
    private func setbuttonlookslike(){
        ButtonT.backgroundColor = .white
        ButtonT.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        ButtonT.layer.cornerRadius = 8
        ButtonT.contentHorizontalAlignment = .left
        ButtonT.setTitle("     찾는 그룹이 없다면 새 그룹을 만들어보세요!", for: .normal)
        //   button1.setTitle("    승인 대기중인 그룹(\(waitinggroup))", for: .normal)
        ButtonT.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        ButtonT.setTitleColor(UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1), for: .normal)}
    
}


