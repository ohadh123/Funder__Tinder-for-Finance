
//
//  TinderCardView.swift
//  TinderFinance
//
//  Created by Ohad Koronyo
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//  Credit to Dennis Fedorko on 10/31/16 © 2016 org.cuappdev
//

import UIKit

class TinderCardView: UIView {
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var likeOverlayImageView: UIImageView!
    var nopeOverlayImageView: UIImageView!
    var descriptionView: UITextView!
    
    var stockImage: UIImage!
    var openNumber: CGFloat = 0
    var highNumber: CGFloat = 0
    var lowNumber: CGFloat = 0
    var marketCapNumber: String = ""
    var volatilityString: String = ""
    var changeNumber: String = ""
    var descText: String!

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        
        clipsToBounds = true
        layer.cornerRadius = 10
        
        backgroundColor = .white
        
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.black.cgColor
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.30))
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.black.cgColor
        addSubview(imageView)
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: frame.height * 0.30, width: frame.width, height: frame.height * 0.70))
        /**let backImage = #imageLiteral(resourceName: "backgroundDark")
        let backImageResize = LoadingPage.resizeImage(image: backImage, newWidth: imageView2.frame.width, newHeight: imageView2.frame.height)
        imageView2.backgroundColor = UIColor(patternImage: backImageResize)**/
        imageView2.backgroundColor = UIColor(colorLiteralRed: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        imageView2.contentMode = .scaleAspectFit
        imageView2.clipsToBounds = true
        addSubview(imageView2)
        
        descriptionView = UITextView(frame: CGRect(x: 0, y: frame.height * 0.43, width: frame.width/1.2, height: frame.height * 0.5))
        descriptionView.center.x = imageView2.center.x
        descriptionView.textAlignment = .left
        descriptionView.font = UIFont(name: "Verdana", size: 15)
        descriptionView.isEditable = false
        descriptionView.isSelectable = false
        descriptionView.text = descText
        descriptionView.backgroundColor = UIColor(colorLiteralRed: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        addSubview(descriptionView)
        
        likeOverlayImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 75, height: 75))
        likeOverlayImageView.image = UIImage(named: "like")
        likeOverlayImageView.alpha = 0.0
        addSubview(likeOverlayImageView)
        
        nopeOverlayImageView = UIImageView(frame: CGRect(x: frame.width - 85, y: 10, width: 75, height: 75))
        nopeOverlayImageView.image = UIImage(named: "nope")
        nopeOverlayImageView.alpha = 0.0
        addSubview(nopeOverlayImageView)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: frame.height * 0.30, width: frame.width, height: frame.height * 0.1))
        nameLabel.center.x = imageView2.center.x
        //nameLabel.baselineAdjustment = .alignCenters
        nameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .gray
        //nameLabel.layer.borderWidth =
        addSubview(nameLabel)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage?, name: String, dText: String) {
        imageView.image = image
        nameLabel.text = name
        self.descText = dText
    }
    
    func updateDesc(){
        descriptionView.text = descText
    }

}
