//
//  LeaderboardsView.swift
//  TinderFinance
//
//  Created by Ohad Koronyo on 9/16/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import InteractiveSideMenu


class LeaderboardsView: MenuContainerViewController {
    
    var menuButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        self.menuViewController = MenuView()

        
        menuButton.center.x = view.frame.width/12
        menuButton.center.y = view.frame.height/16
        menuButton.setTitle("Menu", for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonMethod), for: .touchUpInside)
        menuButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        view.addSubview(menuButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func menuButtonMethod(){
        showSideMenu()
    }
    
    
    
    
}

