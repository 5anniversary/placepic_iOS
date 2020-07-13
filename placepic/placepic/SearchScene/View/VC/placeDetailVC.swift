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

class placeDetailVC: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {

    let imageNames = ["dummy1","dummy2","dummy3","dummy4"]
    @IBOutlet weak var profileImg: UIImageView!
    
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
        super.viewDidLoad()
        setNavigationBar()
        setView()
//        let mapView = NMFMapView(frame: view.frame)
//        view.addSubview(mapView)
//
//        let naverMapView = NMFNaverMapView(frame: view.frame)
//        view.addSubview(naverMapView)
//
//        mapView.mapType = .basic
//
//        let marker = NMFMarker()
//        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
//        marker.mapView = mapView
        // Do any additional setup after loading the view.
    }
    
    private func setView(){
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        detailImg.isInfinite = true
    }
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
        navigationItem.title = "상세정보"
        
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


