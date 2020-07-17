//
//  Extensions+UIView.swift
//  placepic
//
//  Created by elesahich on 2020/07/17.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addActivityIndicator() {
        //    creating a view (let's call it "loading" view) which will be added on top of the view you want to have activity indicator on (parent view)
        let view = UIView()
        //    setting up a background for a view so it would make content under it look like not active
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        //    adding "loading" view to a parent view
        //    setting up auto-layout anchors so it would cover whole parent view
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        //    creating array with images, which will be animated
        //    in my case I have 30 images with names activity0.png ... activity29.png
        var imagesArray: [UIImage] = []
        for i in 1..<7 {
            imagesArray.append(UIImage(named: "loading0\(i)")!)
        }
        
        //    creating UIImageView with array of images
        //    setting up animation duration and starting animation
        let activityImage = UIImageView()
        activityImage.animationImages = imagesArray
        activityImage.animationDuration = TimeInterval(0.8)
        activityImage.startAnimating()
        
        //    adding UIImageView on "loading" view
        //    setting up auto-layout anchors so it would be in center of "loading" view with 30x30 size
        view.addSubview(activityImage)
        activityImage.translatesAutoresizingMaskIntoConstraints = false
        activityImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activityImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func removeActivityIndicator() {
        //    checking if a view has subviews on it
        guard let lastSubView = self.subviews.last else { return }
        //    removing last subview with an assumption that last view is a "loading" view
        lastSubView.removeFromSuperview()
    }
}

