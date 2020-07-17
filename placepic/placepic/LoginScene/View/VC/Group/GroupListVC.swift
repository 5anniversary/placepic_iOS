//
//  GroupListVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/01.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class GroupListVC: UIViewController {
    
    @IBOutlet weak var Grouptablewaitingbutton: UIButton!
    @IBOutlet weak var backWaitingbutton: UIButton!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var groups : [groupData] = []
   
    @IBAction func backwaitingButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "GroupWaitVC") as? GroupWaitVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    @IBAction func grouptablewaitingbuttonAction(_ sender: Any) {
//        guard let vc = self.storyboard?.instantiateViewController(identifier: "GroupWaitVC") as? GroupWaitVC else { return }
//        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func backButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "GroupPartiVC") as? GroupPartiVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    
    @IBOutlet weak var GroupListTV: UITableView!

    @IBAction func buttonAction(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "GroupWaitVC") as? GroupWaitVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    private func setbackground(){
        
        
        
        backWaitingbutton.backgroundColor = .white
        backWaitingbutton.layer.backgroundColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1).cgColor
        backWaitingbutton.layer.cornerRadius = 8
        backWaitingbutton.contentHorizontalAlignment = .left
        backWaitingbutton.setTitle("    승인 대기중인 그룹(\(waitinggroup))", for: .normal)
        backWaitingbutton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        backWaitingbutton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        Grouptablewaitingbutton.backgroundColor = .white
        Grouptablewaitingbutton.layer.backgroundColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1).cgColor
        Grouptablewaitingbutton.layer.cornerRadius = 8
        Grouptablewaitingbutton.contentHorizontalAlignment = .left
        Grouptablewaitingbutton.setTitle("    승인 대기중인 그룹(\(waitinggroup))", for: .normal)
        Grouptablewaitingbutton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        Grouptablewaitingbutton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        
        backLabel.textColor = UIColor(red: 0.808, green: 0.831, blue: 0.855, alpha: 1)
        
        backLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        
        
        // Line height: 18 pt
        
        // (identical to box height)
        
        
        backLabel.textAlignment = .center
        
        backLabel.text = "아직 가입된 그룹이 없습니다."
        
        
        backButton.layer.backgroundColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1).cgColor
        
        backButton.layer.cornerRadius = 4
        
        
        backButton.setTitle("그룹 참여하기", for: .normal)
        backButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        backButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        
        
    }
    var waitinggroup:Int = 0
    
    private var dataInformations: [groupData] = []
    private var dataInformations2: [groupData] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         backWaitingbutton.setTitle("    승인 대기중인 그룹(\(waitinggroup))", for: .normal)
       Grouptablewaitingbutton.setTitle("    승인 대기중인 그룹(\(waitinggroup))", for: .normal)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        print("11111111111111111111111111111111111111")
        print(waitinggroup)
        GroupListTV.delegate = self
        GroupListTV.dataSource = self
        GroupWaitingButtonLooksLike()
        //setNavigationBar()
        setNavi()
        setbackground()
        getData2()
        backWaitingbutton.setTitle("    승인 대기중인 그룹(0)", for: .normal)
        
//        guard let test = UserDefaults.standard.string(forKey: "token") else { return }
       
        
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setNavi() { //타이틀이 가운데에 있는 네비
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "groupIc-1"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(navi))
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "내 그룹"
    }
    
    @objc func navi() {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "GroupPartiVC") as? GroupPartiVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
        //        navigationController?.popViewController(animated: true)
        
        //        let transform = CGAffineTransform(translationX: 0, y: 100)
        //        self.tabBarController?.tabBar.isHidden = false
        //        tabBarController?.tabBar.transform = transform
        //
        //        UIView.animate(withDuration: 0.5,
        //                       delay: 0,
        //                       usingSpringWithDamping: 1,
        //                       initialSpringVelocity: 1,
        //                       options: .curveEaseOut,
        //                       animations: {
        //                        self.tabBarController?.tabBar.transform = .identity
        //
        //        }, completion: nil)
    }
    
    
    
    
}


extension GroupListVC{
    
    private func getData2(){
                GroupWaitService.shared.grouplist { networkResult in
                    switch networkResult {
                        
                    case .success(let products):
                
                        guard let groups = products as? [groupData] else {return}
                    
                        for i in 0..<groups.count{
                         
                            self.dataInformations2.append(groups[i])
                          
                        }
                        
                        self.waitinggroup = self.dataInformations2.count
                       
                        self.viewWillAppear(true)
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
        
    
    private func GroupWaitingButtonLooksLike(){
        
//        GroupWaitingButton.backgroundColor = .white
        Grouptablewaitingbutton.layer.backgroundColor = UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1).cgColor
        Grouptablewaitingbutton.layer.cornerRadius = 8
        Grouptablewaitingbutton.contentHorizontalAlignment = .left
        
        Grouptablewaitingbutton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        Grouptablewaitingbutton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)}
    
    
    //    private func setNavigationBar() {
    //        guard let navigationBar = self.navigationController?.navigationBar else { return }
    //
    //        navigationBar.isTranslucent = true
    //        navigationBar.backgroundColor = UIColor.white
    //        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    //        navigationBar.shadowImage = UIImage()
    //
    //        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "icMenuHamburg"),
    //                                                          style: .plain,
    //                                                          target: self,
    //                                                          action: #selector(showSideMenuBar))
    //        navigationItem.leftBarButtonItem = leftButton
    //    }
    
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

extension GroupListVC {
    
    func getData(){
        print(#function)
        GroupListService.shared.grouplist { networkResult in
            switch networkResult {
                
            case .success(let products):
                print("안ㅇ")
                guard let productdata = products as? [groupData] else { return }
                self.groups = productdata
                //                print("dslk")
                
                
                
                //                self.groups.forEach({
                //                    print($0.groupIdx)
                
                //                })
                for i in 0..<self.groups.count{
                    self.dataInformations.append(self.groups[i])
                    print ("dslk")
                }
                
                if (self.dataInformations.count == 0){
                    self.GroupListTV.alpha = 0}
                
                self.GroupListTV.reloadData()
                
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

extension GroupListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataInformations.count// data count
        
    }
    //    cell.imageView.contentMode = UIViewContentMode.scaleAspectFit
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
       
        //        let groupindex = groups[indexPath.row].groupIdx
        //        UserDefaults.standard.set(groupindex, forKey: "groupIdx")
        //        waitinggroup = UserDefaults.standard.integer(forKey: "groupIdx")
        let sb = UIStoryboard.init(name: "Tabbar", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "TabbarController") as? TabbarController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)
//
//        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "nextNavi") else { return }
//        secondViewController.modalPresentationStyle = .fullScreen
//        self.present(secondViewController, animated: true)
        
        //        guard let vc = self.storyboard?.instantiateViewController(identifier: "GroupUpVC") as? GroupUpVC
        //            else { return }
        //        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "GroupListTVC", for:
            indexPath) as? GroupListTVC else { return UITableViewCell() }
        
        //            TableViewCell.setDataInformation(profileImageName: myProfile[0].photo, name: myProfile[0].name, status: myProfile[0].status)
        
        
        //            TableViewCell.underBar.alpha = 0
        
        //(profileImageName: String, name: String, numofPeople:String, numofPost:String)
        TableViewCell.configDataInformation(profileImageName:dataInformations[indexPath.row].groupImage,
                                            name: dataInformations[indexPath.row].groupName,
                                            numofPeople: dataInformations[indexPath.row].userCount,
                                            numofPost: dataInformations[indexPath.row].postCount  )
        
        TableViewCell.GLProfileImageview.layer.cornerRadius = TableViewCell.GLProfileImageview.frame.height/2
        //            TableViewCell.GLProfileImageview.layer.cornerRadius = 50/2
        TableViewCell.GLProfileImageview.topAnchor.constraint(equalTo: TableViewCell.topAnchor, constant: 13).isActive = true
        TableViewCell.GLProfileImageview.leadingAnchor.constraint(equalTo: TableViewCell.leadingAnchor, constant: 16).isActive = true
        TableViewCell.GLProfileImageview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        TableViewCell.GLProfileImageview.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        TableViewCell.GLProfileImageview.contentMode = .scaleAspectFill
        TableViewCell.GLProfileImageview.layer.cornerRadius = 20 //half of your width or height
        
        
        //(groupname:  signupemail, userCount: signuppw, postCount: signupname, groupImage:)
        
        
        return TableViewCell
        
        
    }
}

//(groupname:  signupemail, userCount: signuppw, postCount: signupname, groupImage:)





