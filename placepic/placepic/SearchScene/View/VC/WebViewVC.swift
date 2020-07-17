////
////  WebViewVC.swift
////  placepic
////
////  Created by 이유진 on 2020/07/17.
////  Copyright © 2020 elesahich. All rights reserved.
////
//
//import UIKit
//
//class WebViewVC: placeDetailVC, UIWebViewDelegate {
//    
//    lazy var webView: UIWebView = {
//        // Generate WebView.
//        let webView = UIWebView()
//        
//        // Set Delegate to itself.
//        webView.delegate = self
//        
//        // Set the size of WebView.
//        webView.frame = self.view.bounds
//        
//        // Set the URL.
//        let url: URL = URL(string: "https://www.naver.com")!
//        
//        // Issue a rev.
//        let request: NSURLRequest = NSURLRequest(url: url)
//        
//        // Issue the request.
//        webView.loadRequest(request as URLRequest)
//        
//        return webView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        
//        // Add UIWebView on view
//        self.view.addSubview(self.webView)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // Called when all pages have been read.
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        print("webViewDidFinishLoad")
//    }
//    
//    // Called when the Page starts loading.
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        print("webViewDidStartLoad")
//    }
//
//}
