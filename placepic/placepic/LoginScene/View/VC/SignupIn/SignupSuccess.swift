//
//  SignupSuccess.swift
//  placepic
//
//  Created by Soojin Lee on 2020/07/15.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SignupSuccess: UIViewController {
    @IBOutlet weak var sucLabel: UILabel!
    @IBOutlet weak var sucButton: UIButton!
    @IBAction func sucButtonAction(_ sender: Any) {
        
        guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
            "SigninVC") as? UIViewController else { return }
        tabbarController.modalPresentationStyle = .fullScreen
        self.present(tabbarController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()

        
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension SignupSuccess {
    private func setDesign(){
        sucLabel.textColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1)
        
        sucLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        sucLabel.textAlignment = .center
        
        sucLabel.text = "회원가입이 완료되었습니다!"
        
        sucButton.layer.cornerRadius = 8
        sucButton.layer.borderWidth = 1
        sucButton.layer.borderColor = UIColor.white.cgColor
        sucButton.clipsToBounds = true
        sucButton.setTitle("로그인 하기", for: .normal)
        sucButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        sucButton.setTitleColor(.white, for: .normal)
        sucButton.backgroundColor = .white
        sucButton.layer.backgroundColor = UIColor(red: 0.212, green: 0.212, blue: 0.212, alpha: 1).cgColor
        sucButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
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
          navigationItem.title = "회원가입"}
      
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
