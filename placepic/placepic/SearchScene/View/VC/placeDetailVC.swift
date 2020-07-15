//
//  placeDetailVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/13.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import NMapsMap
import FSPagerView
import Kingfisher

class placeDetailVC: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {
    
    let imageNames = ["dummy1","dummy2","dummy3","dummy4"]
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var detailViewHC: NSLayoutConstraint!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var heartbutView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPart: UILabel!
    @IBOutlet weak var postNum: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var scrapNum: UILabel!
    @IBOutlet var placeTag: [UITextField]!
    @IBOutlet weak var placeCate: UILabel!
    @IBOutlet weak var placeSubway: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placeInfo: UILabel!
    @IBOutlet weak var likeNum: UILabel!
    
    var selectIdx: Int!
    var placeDetailData: DetailModel?
    
    @IBOutlet weak var detailImg: FSPagerView!{
        didSet {
            self.detailImg.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    @IBOutlet var pageControl: FSPageControl!{
        //홍보배너 밑에 띄울 페이지컨트롤
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count //페이지 수
            self.pageControl.contentHorizontalAlignment = .center //중앙에 배치
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        setNavigationBar()
        getDetailData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        setData()
        print(placeDetailData?.keyword)
        
        if placeDetailData?.keyword.count == 1{
            print(placeDetailData?.keyword)
            placeTag[0].text = placeDetailData?.keyword[0]
//            placeTag[1].isHidden = true
//            placeTag[2].isHidden = true
        }
        else if placeDetailData?.keyword.count == 2{
            placeTag[0].text = placeDetailData?.keyword[0]
            placeTag[1].text = placeDetailData?.keyword[1]
//            placeTag[2].isHidden = true
        }
        else if placeDetailData?.keyword.count == 3{
            placeTag[0].text = placeDetailData?.keyword[0]
            placeTag[1].text = placeDetailData?.keyword[1]
            placeTag[2].text = placeDetailData?.keyword[2]
        }
        else{
//            placeTag[0].isHidden = true
//            placeTag[1].isHidden = true
//            placeTag[2].isHidden = true
        }
        
    }
    
    private func setData(){
        print(#function)
        
        profileImg.layer.cornerRadius = profileImg.frame.height/2
//        profileImg.kf.setImage(with: URL(string: (placeDetailData?.uploader.profileImageURL)!))
//        profileImg.kf.setImage(with: placeDetailData?.uploader.profileImageURL)
        userName.text = placeDetailData?.uploader.userName
        userPart.text = placeDetailData?.uploader.part
//        postNum.text = "작성한 글 " + String(placeDetailData?.uploader.postCount)
        let date:Date = Date(timeIntervalSince1970: TimeInterval(placeDetailData?.placeCreatedAt ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        postDate.text = dateFormatter.string(from: date)
        detailTextView.text = placeDetailData?.placeReview
//        likeNum.text = String(placeDetailData?.likeCount)
        placeName.text = placeDetailData?.placeName
        heartbutView.layer.cornerRadius = 4
        heartbutView.layer.borderWidth = 1.5
        heartbutView.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        
        
        //**setTag
        
    }
    private func getDetailData() {
        print(#function)
        DetailViewService.shared.getPlaces(String(selectIdx)){ networkResult in
            switch networkResult {
            case .success(let products):
                guard let places = products as? DetailModel else { return }
                self.placeDetailData = places
                print(self.placeDetailData)
                self.viewWillAppear(true)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "조회 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("pathErr")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
                
            }
        }
    }
    private func setView(){
//        detailViewHC.constant = self.detailTextView.contentSize.height
        detailViewHC.constant = CGFloat(100)

        profileImg.layer.cornerRadius = profileImg.frame.height/2
        detailImg.isInfinite = true
        buttonView.layer.cornerRadius = 4
        
        heartbutView.layer.cornerRadius = 4
        heartbutView.layer.borderWidth = 2
        heartbutView.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        
        //        bottomView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
    }
    
    //    private func setView(){
    //        profileImg.layer.cornerRadius = profileImg.frame.height/2
    //        detailImg.isInfinite = true
    //    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell{
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        
        return cell
    }
    //FSPagerView
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
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
        navigationItem.title = placeDetailData?.placeName
        
    }
    
    @objc private func dismissVC() {
        navigationController?.popViewController(animated: true)
    }
    
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //
    //        NMFAuthManager.shared().clientId = "YOUR_CLIENT_ID_HERE"
    //
    //        return true
    //
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//extension UIViewController {
//    func reloadViewFromNib() {
//        let parent = view.superview
//        view.removeFromSuperview()
//        view = nil
//        parent?.addSubview(view) // This line causes the view to be reloaded
//    }
//}
