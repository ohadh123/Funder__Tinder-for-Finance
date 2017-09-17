//
//  StockAnalysisView.swift
//  TinderFinance
//
//  Created by Ohad Koronyo on 9/16/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import DynamicButton


class StockAnalysisView: UIViewController {
    
    var backButton: DynamicButton = DynamicButton(frame: CGRect(x: 0, y: 0, width: 125, height: 50))
    var stockImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
    var stockImageLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
    
    var openLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    var highLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    var lowLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    var marketCapLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    var volatilityLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    var percentChangeLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    
    var openNumber: CGFloat = 0
    var highNumber: CGFloat = 0
    var lowNumber: CGFloat = 0
    var marketCapNumber: String = ""
    var volatilityString: String = ""
    var changeNumber: String = ""
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
    convenience init(sImage: UIImage, oNumber: CGFloat, hNumber: CGFloat, lNumber: CGFloat, mCapNumber: String, vString: String, cNumber: String) {
        self.init(nibName:nil, bundle:nil)
        
        self.stockImage.image = sImage
        self.openNumber = oNumber
        self.highNumber = hNumber
        self.lowNumber = lNumber
        self.marketCapNumber = mCapNumber
        self.volatilityString = vString
        self.changeNumber = cNumber
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backImage = #imageLiteral(resourceName: "backgroundLight")
        let backImageResize = LoadingPage.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        self.view.backgroundColor = UIColor(patternImage: backImageResize)

        
        let whiteBorder = UIImageView(frame: CGRect(x: 0, y: 0, width: 410, height: 485))
        whiteBorder.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        whiteBorder.layer.borderWidth = 2
        whiteBorder.layer.borderColor = UIColor.black.cgColor
        whiteBorder.center.x = view.frame.width/2
        whiteBorder.center.y = view.frame.height/1.9
        whiteBorder.layer.cornerRadius = whiteBorder.frame.width/12
        
        view.addSubview(whiteBorder)
        
        makeButton()
        makeMarketImage()
        makeOtherLabels()
    }
    func makeOtherLabels(){
        
        let grayBorder = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        grayBorder.backgroundColor = UIColor(colorLiteralRed: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        grayBorder.layer.borderWidth = 2
        grayBorder.layer.borderColor = UIColor.black.cgColor
        grayBorder.center.x = view.frame.width/2
        grayBorder.center.y = view.frame.height/1.425
        grayBorder.layer.cornerRadius = grayBorder.frame.width/8
        
        view.addSubview(grayBorder)
        
        
        makeLabel(label: openLabel, text: "Open: " + String(describing: openNumber), widthDivisor: 2.85, heightDivisor: 1.6, fontSize: 20, left: "left")
        makeLabel(label: highLabel, text: "High: " + String(describing: highNumber), widthDivisor: 2.85, heightDivisor: 1.425, fontSize: 20, left: "left")
        makeLabel(label: lowLabel, text: "Low: " + String(describing: lowNumber), widthDivisor: 2.85, heightDivisor: 1.28, fontSize: 20, left: "left")
        
        makeLabel(label: marketCapLabel, text: "Mkt Cap: " + String(describing: marketCapNumber), widthDivisor: 1.35, heightDivisor: 1.6, fontSize: 20, left: "left")
        makeLabel(label: volatilityLabel, text: "Volatility: " + String(describing: volatilityString), widthDivisor: 1.35, heightDivisor: 1.425, fontSize: 20, left: "left")
        makeLabel(label: percentChangeLabel, text: "% Change: " + String(describing: changeNumber), widthDivisor: 1.35, heightDivisor: 1.28, fontSize: 20, left: "left")
        
        
    }
    
    func makeLabel(label: UILabel, text:String, widthDivisor: CGFloat, heightDivisor: CGFloat, fontSize: CGFloat, left: String)
    {
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.center.x = view.frame.width/widthDivisor
        label.center.y = view.frame.height/heightDivisor
        if left == "left" { label.textAlignment = .left }
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        view.addSubview(label)
    }
    
    func makeMarketImage(){
        stockImage.center.x = view.frame.width/2
        stockImage.center.y = view.frame.height/2.5
        
        makeLabel(label: stockImageLabel, text: "Monthly Chart", widthDivisor: 2, heightDivisor: 4, fontSize: 35, left: "None")
        
        view.addSubview(stockImage)
        view.addSubview(stockImageLabel)
    }
    
    func makeButton(){
        /**backButton.center.x = view.frame.width/1.2
        backButton.center.y = view.frame.height/16
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonMethod), for: .touchUpInside)
        backButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        backButton.titleLabel?.textColor = .black
        backButton.backgroundColor = .black
        view.addSubview(backButton)**/
        
        backButton.setStyle(.caretDown, animated: true)
        backButton.lineWidth           = 4
        backButton.strokeColor         = .black
        backButton.highlightStokeColor = .gray
        backButton.center.x = view.frame.width/2
        backButton.center.y = view.frame.height/18
        backButton.addTarget(self, action: #selector(backButtonMethod), for: .touchUpInside)

        view.addSubview(backButton)
    }
    
    func backButtonMethod(){
        dismiss(animated: true)
    }
    
    
}

