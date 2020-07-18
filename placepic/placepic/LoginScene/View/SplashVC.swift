

//
//  SplashViewController.swift
//  Crecker_iOS
//
//  Created by elesahich on 2020/01/04.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import Lottie

class SplashVC: UIViewController {
    //
    //    @IBOutlet weak var AnimationView: LottieView!
    @IBOutlet weak var AnimationView: LottieView!
    
    var mTimer: Timer?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimation()
        ticktok()
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func startAnimation() {
        let animationView = Lottie.AnimationView(name:"pp_splash_final")
        self.view.backgroundColor = UIColor.warmPink
        animationView.frame = CGRect(x:0, y:0, width: 456, height: 812)
        animationView.layer.backgroundColor = UIColor.warmPink.cgColor
        animationView.center = self.view.center
        animationView.clipsToBounds = true
        
        self.view.addSubview(animationView)
        animationView.play()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
    }
    
    func ticktok(){
        
        if let timer = mTimer {
            //timer 객체가 nil 이 아닌경우에는 invalid 상태에만 시작한다
            if !timer.isValid {
                /** 1초마다 timerCallback함수를 호출하는 타이머 */
                mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            }
        } else {
            //timer 객체가 nil 인 경우에 객체를 생성하고 타이머를 시작한다
            /** 1초마다 timerCallback함수를 호출하는 타이머 */
            mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCallback(){
        number += 1
        if number == 3 {
            //Thread.sleep(forTimeInterval: 1) //1초만 재우기
            
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "loginNavi") else { return }
            
            //            vc.modalTransitionStyle = .crossDissolve
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
            
        }
    }
}

