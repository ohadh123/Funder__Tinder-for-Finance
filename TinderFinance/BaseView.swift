//
//  BaseView.swift
//  TinderFinance
//
//  Created by Ohad Koronyo on 9/16/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class BaseView: MenuContainerViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        self.menuViewController = MenuView()
        self.contentViewControllers = contentControllers()
        selectContentViewController(contentViewControllers.first!)
    }
    
    private func contentControllers() -> [MenuViewController] {
        var contentList = [MenuViewController]()
        let tinderFeedView = TinderFeedViewController()
        let viewController = ViewController()
        let leaderboardsView = LeaderboardsView()
        contentList.append(tinderFeedView)
        contentList.append(viewController)
        contentList.append(leaderboardsView)
        return contentList
        
    }

}
