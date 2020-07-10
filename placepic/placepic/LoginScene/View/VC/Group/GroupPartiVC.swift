//
//  GroupPartiVC.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class GroupPartiVC: UIViewController {
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setbuttonlookslike()
        // Do any additional setup after loading the view.
    }
    
    
    
    
}

extension GroupPartiVC{
    private func setbuttonlookslike(){
        button1.backgroundColor = .white
        button1.layer.backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
        button1.layer.cornerRadius = 8
        button1.contentHorizontalAlignment = .left
        button1.setTitle("찾는 그룹이 없다면 새 그룹을 만들어보세요!", for: .normal)
        //   button1.setTitle("    승인 대기중인 그룹(\(waitinggroup))", for: .normal)
        button1.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        button1.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)}
    
}

