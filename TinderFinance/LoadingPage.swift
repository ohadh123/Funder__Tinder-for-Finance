//
//  LoadingPage.swift
//  TinderFinance
//
//  Created by Ohad Koronyo on 9/15/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import DynamicButton


class LoadingPage: UIViewController {
    var squareFrameView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createTitleScreen()
        
        
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor.white
        
        /**squareFrameView.image = #imageLiteral(resourceName: "LoadingScreenSquare")
        squareFrameView.center.x = view.frame.width/2
        squareFrameView.center.y = view.frame.height/2
        view.addSubview(squareFrameView)**/
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 350, height: 500))
        logoImageView.image = #imageLiteral(resourceName: "FunderLogo")
        logoImageView.center.x = view.frame.width/2
        logoImageView.center.y = view.frame.height/2.5
        view.addSubview(logoImageView)
        
        let loadingIcon = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        //let viewload = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loadingIcon.center.x = view.frame.width/2
        loadingIcon.center.y = view.frame.height/1.7
        loadingIcon.type = .ballPulse
        loadingIcon.startAnimating()
        
        let delayInSeconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            loadingIcon.stopAnimating()
            let viewController = TinderFeedViewController()
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: true, completion: nil)
        }
        view.addSubview(loadingIcon)
        
    }
    
    func createTitleScreen(){
        let backImage = #imageLiteral(resourceName: "backgroundLight")
        let backImageResize = LoadingPage.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        self.view.backgroundColor = UIColor(patternImage: backImageResize)
        
    }
    
    static func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage
    {
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 1)
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
}
