//
//  MenuView.swift
//  TinderFinance
//
//  Created by Ohad Koronyo on 9/16/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class MenuView: MenuViewController, SideMenuItemContent {
    var exploreButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    var portfolioButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    var leaderboardsButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    var settingsButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    var profileImageView: UIImageView!
    var purchasePowerLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func createTitleScreen(){
        let backImage = #imageLiteral(resourceName: "backgroundDark")
        let backImageResize = LoadingPage.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        self.view.backgroundColor = UIColor(patternImage: backImageResize)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let largeNumber = PurchasingPower.money
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
        
        purchasePowerLabel.text = "$"+formattedNumber!
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createTitleScreen()
        makeFrames()
        
        profileImageView = UIImageView(frame: CGRect(x: 0, y: 250, width: view.frame.width/2.76, height: view.frame.height/4.9))
        profileImageView.center = CGPoint(x: view.center.x/1.18, y: view.frame.height/4.9)
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2.1
        profileImageView.image = #imageLiteral(resourceName: "ohadpic")
        //profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        view.addSubview(profileImageView)
        
        let purchasePowerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.38, height: view.frame.height/7.36))
        
        let largeNumber = PurchasingPower.money
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
        
        purchasePowerLabel.text = "$"+formattedNumber!
        purchasePowerLabel.textColor = UIColor(colorLiteralRed: 0/255, green: 100/255, blue: 0/255, alpha: 1)
        purchasePowerLabel.textAlignment = .center
        purchasePowerLabel.center.x = view.frame.width/2.35
        purchasePowerLabel.center.y = view.frame.height/2.7
        purchasePowerLabel.font = UIFont.boldSystemFont(ofSize: 22)
        purchasePowerLabel.textAlignment = .center
        view.addSubview(purchasePowerLabel)
        
        let usernameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.38, height: view.frame.height/7.36))
        
        usernameLabel.text = "@ohad_koronyo"
        usernameLabel.textColor = .black
        usernameLabel.textAlignment = .center
        usernameLabel.center.x = view.frame.width/2.4
        usernameLabel.center.y = view.frame.height/3
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        usernameLabel.textAlignment = .center
        view.addSubview(usernameLabel)
        
        exploreButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.38, height: view.frame.height/7.36))
        portfolioButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.38, height: view.frame.height/7.36))
        leaderboardsButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.38, height: view.frame.height/7.36))
        settingsButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.38, height: view.frame.height/7.36))

        
        makeButton(button: exploreButton, widthDivisor: 2.4, heightDivisor: 2.15, title: "Explore", sizeTitle: 66)
        exploreButton.addTarget(self, action: #selector(exploreMethod), for: .touchUpInside)
        
        makeButton(button: portfolioButton, widthDivisor: 2.4, heightDivisor: 1.72, title: "My Portfolio", sizeTitle: 35)
        portfolioButton.addTarget(self, action: #selector(portfolioMethod), for: .touchUpInside)
        
        makeButton(button: leaderboardsButton, widthDivisor: 2.4, heightDivisor: 1.5, title: "Leaderboards", sizeTitle: 35)
        leaderboardsButton.addTarget(self, action: #selector(leaderboardsMethod), for: .touchUpInside)
        
        makeButton(button: settingsButton, widthDivisor: 2.4, heightDivisor: 1.335, title: "Settings", sizeTitle: 35)
        settingsButton.addTarget(self, action: #selector(settingsMethod), for: .touchUpInside)
        
    }
    
    func makeButton(button: UIButton, widthDivisor: CGFloat, heightDivisor: CGFloat, title: String, sizeTitle: CGFloat){
        button.center.x = view.frame.width/widthDivisor
        button.center.y = view.frame.height/heightDivisor
        button.setTitle(title, for: .normal)
        button.titleLabel!.font =  UIFont(name: "Verdana", size: sizeTitle)
        view.addSubview(button)
        
    }
    func makeFrames(){
        
        
        let whiteBorder = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.84, height: view.frame.height/2.944))
        whiteBorder.backgroundColor = UIColor(colorLiteralRed: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        whiteBorder.layer.borderWidth = 2
        whiteBorder.layer.borderColor = UIColor.black.cgColor
        whiteBorder.center = CGPoint(x: view.center.x/1.18, y: view.center.y/2.15)
        whiteBorder.layer.cornerRadius = whiteBorder.frame.width/8
        
        view.addSubview(whiteBorder)
    }
    
    func exploreMethod(){
        let tinderFeed = TinderFeedViewController()
        tinderFeed.modalTransitionStyle = .crossDissolve
        self.present(tinderFeed, animated: true, completion: nil)
    }
    func portfolioMethod(){
        let portfolioView = UINavigationController.init(rootViewController: CompanyFeedViewController())
        portfolioView.modalTransitionStyle = .crossDissolve
        self.present(portfolioView, animated: true, completion: nil)
    }
    func leaderboardsMethod(){
        let leaderboardsView = UINavigationController.init(rootViewController: FeedViewController())
        leaderboardsView.modalTransitionStyle = .crossDissolve
        self.present(leaderboardsView, animated: true, completion: nil)
    }
    func settingsMethod(){
        
    }
    
    
    
}
