//
//  DetailViewController.swift
//  TableViewApp
//
//  Created by Ethan Goolish on 9/16/17.
//  Copyright © 2017 Ethan Goolish. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    var player: Player!
    var nameLabel: UILabel!
    var profileImageView: UIImageView!
    var comp1View: UIImageView!
    var comp2View: UIImageView!
    var comp3View: UIImageView!
    var positionLabel: UILabel!
    var scoreLabel: UILabel!
    var blueBackground: UIView!
    var titleLabel: UILabel!
    var comp1Label: UILabel!
    var comp2Label: UILabel!
    var comp3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        initializeViews()
        
    }
    
    func initializeViews() {
        profileImageView = UIImageView(frame: CGRect(x: 0, y: 250, width: 150, height: 150))
        profileImageView.center = CGPoint(x: view.center.x, y: 200)
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.image = player.image ?? #imageLiteral(resourceName: "ethanpic")
        //profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        
        titleLabel = UILabel(frame: CGRect(x: 10, y: 415, width: 500, height: 40))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = "Top Investment Earnings: "
        
        comp1View = UIImageView(frame: CGRect(x: 0, y: 550, width: 200, height: 50))
        comp1View.center = CGPoint(x: view.frame.width/3, y: view.frame.height/1.45+30)
        comp1View.image = player.comp1 ?? #imageLiteral(resourceName: "googlepic")
        comp1View.clipsToBounds = true
        
        comp1Label = UILabel(frame: CGRect(x: view.frame.width/1.4, y: view.frame.height/1.45+5, width: view.frame.width/3, height: 40))
        if let val1 = player.val1{
        comp1Label.text = "(+\(val1)%)"}
        
        comp2View = UIImageView(frame: CGRect(x: 0, y: 550, width: 200, height: 50))
        comp2View.center = CGPoint(x: view.frame.width/3, y: view.frame.height/1.45+100)
        comp2View.image = player.comp2 ?? #imageLiteral(resourceName: "microsoftpic")
        comp2View.clipsToBounds = true
        
        comp2Label = UILabel(frame: CGRect(x: view.frame.width/1.4, y: view.frame.height/1.45 + 75, width: view.frame.width/3, height: 40))
        if let val2 = player.val2{
        comp2Label.text = "(+\(val2)%)"}
        
        comp3View = UIImageView(frame: CGRect(x: 0, y: 550, width: 200, height: 50))
        comp3View.center = CGPoint(x: view.frame.width/3, y: view.frame.height/1.45+170)
        comp3View.image = player.comp3 ?? #imageLiteral(resourceName: "capitalonepic")
        comp3View.clipsToBounds = true
        
        comp3Label = UILabel(frame: CGRect(x: view.frame.width/1.4, y: view.frame.height/1.45 + 145, width: view.frame.width/3, height: 40))
        if let val3 = player.val3{
        comp3Label.text = "(+\(val3)%)"}
        
        
        blueBackground = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: profileImageView.frame.origin.y + profileImageView.frame.height/2))
        blueBackground.backgroundColor = UIColor(colorLiteralRed: 166.0/255.0, green: 207.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        
        nameLabel = UILabel(frame: CGRect(x: profileImageView.frame.origin.x, y: profileImageView.frame.origin.y + 150, width: 150, height: 40))
        nameLabel.center = CGPoint(x: view.frame.width/2, y: nameLabel.center.y)
        nameLabel.text = player.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textAlignment = .center
        
        scoreLabel = UILabel(frame: CGRect(x: 20, y: profileImageView.frame.origin.y + 235, width: view.frame.width/5*4, height: 40))
        if let score = player.score {
            scoreLabel.text = "Score:   \(score)"
        }
        scoreLabel.setBottomBorder()
        
        positionLabel = UILabel(frame: CGRect(x: 20, y: profileImageView.frame.origin.y + 185, width: view.frame.width/5*4, height: 40))
        if let position = player.position {
            positionLabel.text = "Overall Rank:    \(position)"
        }
        positionLabel.setBottomBorder()
        
        
        
        view.addSubview(profileImageView)
        view.insertSubview(blueBackground, belowSubview: profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(scoreLabel)
        view.addSubview(positionLabel)
        view.addSubview(comp1View)
        view.addSubview(comp2View)
        view.addSubview(comp3View)
        view.addSubview(titleLabel)
        view.addSubview(comp1Label)
        view.addSubview(comp2Label)
        view.addSubview(comp3Label)
    }
    
}

extension UILabel {
    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 0.0
    }
}
    
    
    

