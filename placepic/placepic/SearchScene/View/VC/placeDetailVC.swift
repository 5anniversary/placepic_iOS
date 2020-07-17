//
//  placeDetailVC.swift
//  placepic
//
//  Created by 이유진 on 2020/07/13.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import SafariServices
import NMapsMap
import FSPagerView
import Kingfisher

class placeDetailVC: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {

    var selectIdx: Int!
    var placeDetailData: DetailModel?

    var imageNames:[String] = []
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
    
    
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "tolikeListVC" {
            if let destination = segue.destination as? likeListVC {
                destination.placeindex = self.selectIdx
            }
        }
    }
    
    @IBAction func webButton(_ sender: Any) {
        print(placeDetailData?.mobileNaverMapLink ?? "")
//        guard let urls = URL(string: placeDetailData!.mobileNaverMapLink), UIApplication.shared.canOpenURL(urls) else { return }
//        print("url : \(urls)")
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
//        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        let url = URL(string: encodedString)!
        
        guard let url = placeDetailData?.mobileNaverMapLink else { return }
        let encodedString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let urlString = URL(string: encodedString) else { return }

        //        guard let url = urlString else { return }
        let safariViewController = SFSafariViewController(url: urlString)
        present(safariViewController, animated: true, completion: nil)


    }
    @IBAction func likeButton(_ sender: Any) {
        
        guard var like = placeDetailData?.likeCount else { return }
        
        if placeDetailData?.isLiked == false{
            likeButton.setImage(UIImage(named: "icSelectedHeart"), for: .normal)
            heartbutView.layer.borderColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1).cgColor
            placeDetailData?.isLiked = true
            
            like = like + 1
            likeNum.text = "\(like)"
            placeDetailData?.likeCount = like
            
            likeButtonService.shared.like(placeIdx: self.selectIdx) { networkResult in
                switch networkResult {
                case .success:
                    print(self.selectIdx)
                case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "좋아요 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
                case .pathErr: print("path")
                case .serverErr: print("serverErr")
                case .networkFail: print("networkFail")
                }
            }
        }
        else{
            likeButton.setImage(UIImage(named: "icUnselectedHeart"), for: .normal)
            heartbutView.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
            placeDetailData?.isLiked = false

            like = like - 1
            likeNum.text = "\(like)"
            placeDetailData?.likeCount = like
            
            likeButtonService.shared.delete(placeIdx: self.selectIdx) { networkResult in
                switch networkResult {
                case .success:
                    print(self.selectIdx)
                case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "좋아요 취소 실패", message: message, preferredStyle: .alert)
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
    
    @IBAction func bookmarkButton(_ sender: Any) {
        guard var bookmark = placeDetailData?.bookmarkCount else { return }
        
        if placeDetailData?.isBookmarked == false{
            bookmarkButton.setImage(UIImage(named: "icSelectedBookmark"), for: .normal)
            placeDetailData?.isBookmarked = true
            
            bookmark = bookmark + 1
            scrapNum.text = "\(bookmark)"
            placeDetailData?.bookmarkCount = bookmark
            
            bookmarkService.shared.like(placeIdx: self.selectIdx) { networkResult in
                switch networkResult {
                case .success:
                    print(self.selectIdx)
                case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "북마크 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
                case .pathErr: print("path")
                case .serverErr: print("serverErr")
                case .networkFail: print("networkFail")
                }
            }
        }
        else{
            bookmarkButton.setImage(UIImage(named: "icUnselectedBookmark"), for: .normal)
//            heartbutView.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
            placeDetailData?.isBookmarked = false

            bookmark = bookmark - 1
            scrapNum.text = "\(bookmark)"
            placeDetailData?.bookmarkCount = bookmark
            
            bookmarkService.shared.delete(placeIdx: self.selectIdx) { networkResult in
                switch networkResult {
                case .success:
                    print(self.selectIdx)

                    self.dismiss(animated: true, completion: nil)
                case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "북마크 취소 실패", message: message, preferredStyle: .alert)
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
    @IBOutlet weak var detailImg: FSPagerView!{
        didSet {
            self.detailImg.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    @IBOutlet var pageControl: FSPageControl!{
        //페이지컨트롤
        didSet {
            self.pageControl.numberOfPages = imageNames.count //페이지 수
            self.pageControl.contentHorizontalAlignment = .center //중앙에 배치
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetailData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
        setView()
        setNavigationBar()
        
        self.pageControl.setImage(UIImage(named: "circle1"), for: .selected)
        self.pageControl.setImage(UIImage(named: "circle2"), for: .normal)
    }
    
    private func setData(){
        guard let postcount = placeDetailData?.uploader.postCount else { return }
        guard let likecount = placeDetailData?.likeCount else { return }
        guard let scrapcount = placeDetailData?.bookmarkCount else { return }
        
        profileImg.layer.cornerRadius = profileImg.frame.height/2
//        profileImg.kf.setImage(with: URL(string: )
        profileImg.kf.setImage(with: URL(string: placeDetailData?.uploader.profileImageURL ?? ""))
//        profileImg.kf.setImage(with: placeDetailData?.uploader.profileImageURL)
        userName.text = placeDetailData?.uploader.userName
        userPart.text = placeDetailData?.uploader.part
        postNum.text = "작성한 글 \(postcount)"
        let date:Date = Date(timeIntervalSince1970: TimeInterval(placeDetailData?.placeCreatedAt ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        postDate.text = dateFormatter.string(from: date)
        detailTextView.text = placeDetailData?.placeReview
        likeNum.text = "\(likecount)"
        placeName.text = placeDetailData?.placeName
        heartbutView.layer.cornerRadius = 4
        heartbutView.layer.borderWidth = 1.5
        heartbutView.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        
        //**setTag
        if placeDetailData?.keyword.count == 1{
            placeTag[0].text = placeDetailData?.keyword[0]
            placeTag[1].isHidden = true
            placeTag[2].isHidden = true
        }
        else if placeDetailData?.keyword.count == 2{
            placeTag[0].text = placeDetailData?.keyword[0]
            placeTag[1].text = placeDetailData?.keyword[1]
            placeTag[2].isHidden = true
        }
        else if placeDetailData?.keyword.count == 3{
            placeTag[0].text = placeDetailData?.keyword[0]
            placeTag[1].text = placeDetailData?.keyword[1]
            placeTag[2].text = placeDetailData?.keyword[2]
        }
        else if placeDetailData?.keyword.count == 0{
            placeTag[0].isHidden = true
            placeTag[1].isHidden = true
            placeTag[2].isHidden = true
        }
        for i in 0..<3{
            placeTag[i].clipsToBounds = true
            placeTag[i].layer.borderWidth = 2
            placeTag[i].layer.borderColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1).cgColor
            placeTag[i].backgroundColor = UIColor(red: 0.945, green: 0.957, blue: 0.961, alpha: 1)
            placeTag[i].layer.cornerRadius = 4
            placeTag[i].isEnabled = false
        }
        scrapNum.text = "\(scrapcount)"

        if placeDetailData?.categoryIdx == 1{
            placeCate.text = "맛집"
        }
        else if placeDetailData?.categoryIdx == 2{
            placeCate.text = "술집"
        }
        else if placeDetailData?.categoryIdx == 3{
            placeCate.text = "카페"
        }
        else if placeDetailData?.categoryIdx == 4{
            placeCate.text = "스터디"
        }
        else if placeDetailData?.categoryIdx == 5{
            placeCate.text = "기타공간"
        }
        
        var substr:String = ""
        guard let subwaycount = placeDetailData?.subway.count else { return }
        for i in 0..<subwaycount {
            if i == 0 || i == placeDetailData?.subway.count {
                substr = substr + (placeDetailData?.subway[i])!
            }
            else if i > 0 {
                substr = substr + "/" + (placeDetailData?.subway[i])!
            }
        }
        placeSubway.text = substr
        placeAddress.text = placeDetailData?.placeRoadAddress
        
        var substr2:String = ""
        guard let count2 = placeDetailData?.placeInfo.count else { return }
        for i in 0..<count2 {
            if i == 0 || i == placeDetailData?.placeInfo.count {
                substr2 = substr2 + (placeDetailData?.placeInfo[i])!
            }
            else if i > 0 {
                substr2 = substr2 + " · " + (placeDetailData?.placeInfo[i])!
            }
        }
        placeInfo.text = substr2
        navigationItem.title = placeDetailData?.placeName
    
        var substr3:String = ""
        guard let count3 = placeDetailData?.imageURL.count else { return }
        for i in 0..<count3 {
            imageNames.append(placeDetailData?.imageURL[i] ?? "")
        }
        
        guard let imageNames = placeDetailData?.imageURL else { return }
        
        if placeDetailData?.isLiked == true {
            likeButton.setImage(UIImage(named: "icSelectedHeart"), for: .normal)
            heartbutView.layer.borderColor = UIColor(red: 0.965, green: 0.361, blue: 0.424, alpha: 1).cgColor
        }
        
        if placeDetailData?.isBookmarked == true{
            bookmarkButton.setImage(UIImage(named: "icSelectedBookmark"), for: .normal)
        }
        
    }
    
    private func getDetailData() {
        DetailViewService.shared.getPlaces(String(selectIdx)){ networkResult in
            switch networkResult {
            case .success(let products):
                guard let places = products as? DetailModel else { return }
                self.placeDetailData = places
                self.detailImg.reloadData()
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
        
        detailViewHC.constant = self.detailTextView.contentSize.height
//        detailViewHC.constant = CGFloat(100)

        profileImg.layer.cornerRadius = profileImg.frame.height/2
        detailImg.isInfinite = false
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
//        cell.imageView?.image = UIImage(named: self.imageNames[index])
//        placePhoto.kf.setImage(with: URL(string: pPhoto))
        cell.imageView?.kf.setImage(with: URL(string: self.imageNames[index]))
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
        
        if placeDetailData?.uploader.deleteBtn == true{
            let rightButton: UIBarButtonItem = UIBarButtonItem(title: "삭제",
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(deleteData))
            
            navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    @objc private func dismissVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func deleteData() {
        placeDeleteService.shared.delete(placeIdx: selectIdx){ networkResult in
            switch networkResult {
            case .success(let products):
                print(self.selectIdx)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "삭제 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("pathErr")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
                
            }
        }
    }
  
    
}

