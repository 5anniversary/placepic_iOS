//
//  ClassifyVC.swift
//  placepic
//
//  Created by elesahich on 2020/07/13.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class ClassifyVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var classifyModel: [ClassifyModel] = [
        ClassifyModel(image: UIImage(named: "circleRestaurant"), title: "맛집"),
        ClassifyModel(image: UIImage(named: "icDrink"), title: "술집"),
        ClassifyModel(image: UIImage(named: "circleCafe"), title: "카페"),
        ClassifyModel(image: UIImage(named: "circleStudy"), title: "스터디"),
        ClassifyModel(image: UIImage(named: "circleEtc"), title: "기타")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addActivityIndicator()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.view.removeActivityIndicator()
        })
        
        setNavigationBar()
        configTableView()
    }
}

extension ClassifyVC {
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "ClassifyFavoritePlaceTVC", bundle: nil), forCellReuseIdentifier: "ClassifyFavoritePlaceTVCIdentifier")
    }

    private func setNavigationBar() {
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
        navigationItem.title = "최애장소 등록하기"
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}

extension ClassifyVC: UITableViewDelegate { }
extension ClassifyVC: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassifyFavoritePlaceTVCIdentifier") as? ClassifyFavoritePlaceTVC else {
            return UITableViewCell()
        }
        cell.model = classifyModel[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "FavoritePlaceSearchVC") as? FavoritePlaceSearchVC else {
            return
        }
        
        vc.classifyText = classifyModel[indexPath.item].title
        navigationController?.pushViewController(vc, animated: true)
    }
}


