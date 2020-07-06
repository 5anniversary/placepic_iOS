//
//  PeopleDetailVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/06.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class PeopleDetailVC: UIViewController {
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelPart: UILabel!
    @IBOutlet var labelBirth: UILabel!
    @IBOutlet var labelPhone: UILabel!
    @IBOutlet var labelGender: UILabel!
    
    var selectedData: adminListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        labelName.text = selectedData?.name
        labelPart.text = selectedData?.part
        labelBirth.text = selectedData?.birth
        labelPhone.text = selectedData?.phone
        labelGender.text = selectedData?.gender
    }
   
}
