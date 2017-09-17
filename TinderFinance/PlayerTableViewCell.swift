//
//  PersonTableViewCell.swift
//  TableViewApp
//
//  Created by Ethan Goolish on 9/16/17.
//  Copyright © 2017 Ethan Goolish. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell{
    
    var player: Player!
    var nameLabel: UILabel!
    var profileImageView: UIImageView!
    var positionLabel: UILabel!
    var scoreLabel: UILabel!
    var separatorLine: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        positionLabel = UILabel()
        separatorLine = UILabel()
        scoreLabel = UILabel()
        profileImageView = UIImageView()
        
        addSubview(nameLabel)
        addSubview(positionLabel)
        addSubview(scoreLabel)
        addSubview(profileImageView)
        addSubview(separatorLine)
    }
    
    override func layoutSubviews() {
        
        profileImageView.frame = CGRect(x: 40, y: 0, width: 50, height: 50)
        profileImageView.center = CGPoint(x: profileImageView.center.x, y: frame.height/2)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        nameLabel.frame = CGRect(x: 20 + profileImageView.frame.width + profileImageView.frame.origin.x, y: 12, width: 200, height: frame.height/2)
        
        scoreLabel.frame = CGRect(x: 20 + profileImageView.frame.width + profileImageView.frame.origin.x, y: frame.height/2, width: 150, height: frame.height/4)

        positionLabel.frame = CGRect(x: 15, y: frame.height/2 - 7, width: 200, height: frame.height/5)
        
        separatorLine.frame = CGRect(x: 20, y: frame.height - 1, width: frame.width - 40, height: 1)
        separatorLine.backgroundColor = UIColor(colorLiteralRed: 0.6, green: 0.6, blue: 0.6, alpha: 0.4)
    }
    
    func setUpCellWithPlayer (profileImage: UIImage?, name: String?, position: String?, score: String?) {
        profileImageView.image = profileImage ?? #imageLiteral(resourceName: "ethanpic")
        if let name = name {
            nameLabel.text = name
            nameLabel.font = UIFont(name: nameLabel.font.fontName, size: 18)
        }
        if let position = position {
            positionLabel.text = position
            positionLabel.font = UIFont(name: positionLabel.font.fontName, size: 16)
        }
        if let score = score {
            scoreLabel.text = score
            scoreLabel.font = UIFont(name: scoreLabel.font.fontName, size: 13)
        }
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
        nameLabel.text = nil
        positionLabel.text = nil
        scoreLabel.text = nil
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
