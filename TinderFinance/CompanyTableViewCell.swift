//
//  CompanyTableViewCell.swift
//  Portfolio
//
//  Created by Robert Li on 9/16/17.
//  Copyright © 2017 Robert Li. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell{
    
    var company: Company!
    var nameLabel: UILabel!
    var profileImageView: UIImageView!
    var numberLabel: UILabel!
    var percentchangeLabel: UILabel!
    var separatorLine: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        numberLabel = UILabel()
        separatorLine = UILabel()
        percentchangeLabel = UILabel()
        profileImageView = UIImageView()
        
        addSubview(nameLabel)
        addSubview(numberLabel)
        addSubview(percentchangeLabel)
        addSubview(profileImageView)
        addSubview(separatorLine)
        
    }
    
    override func layoutSubviews() {
        
        profileImageView.frame = CGRect(x: 40, y: 0, width: 50, height: 50)
        profileImageView.center = CGPoint(x: profileImageView.center.x, y: frame.height/2)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        
        nameLabel.frame = CGRect(x: 20 + profileImageView.frame.width + profileImageView.frame.origin.x, y: 12, width: 200, height: frame.height/2)
        
        percentchangeLabel.frame = CGRect(x: 20 + profileImageView.frame.width + profileImageView.frame.origin.x, y: frame.height/2, width: 150, height: frame.height/4)
        
        numberLabel.frame = CGRect(x: 15, y: frame.height/2 - 7, width: 200, height: frame.height/5)
        
        separatorLine.frame = CGRect(x: 20, y: frame.height - 1, width: frame.width - 40, height: 1)
        separatorLine.backgroundColor = UIColor(colorLiteralRed: 0.6, green: 0.6, blue: 0.6, alpha: 0.4)
    }
    
    func setUpCellWithCompany (profileImage: UIImage?, name: String?, number: String?, percent: String?) {
        profileImageView.image = profileImage ?? #imageLiteral(resourceName: "ethanpic")
        if let name = name {
            nameLabel.text = name
            nameLabel.font = UIFont(name: nameLabel.font.fontName, size: 18)
        }
        if let number = number {
            numberLabel.text = number
            numberLabel.font = UIFont(name: numberLabel.font.fontName, size: 16)
        }
        if let percent = percent {
            percentchangeLabel.text = percent
            percentchangeLabel.font = UIFont(name: percentchangeLabel.font.fontName, size: 13)
            percentchangeLabel.textColor = (percentchangeLabel.text?.contains("+"))! ? .green : .red
        }
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
        nameLabel.text = nil
        numberLabel.text = nil
        percentchangeLabel.text = nil
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
