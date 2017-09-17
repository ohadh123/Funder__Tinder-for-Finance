//
//  ViewController.swift
//  TableViewApp
//
//  Created by Ethan Goolish on 9/16/17.
//  Copyright © 2017 Ethan Goolish. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import DynamicButton

class Player {
    
    var name: String
    var position: String?
    var image: UIImage?
    var score: String?
    var comp1: UIImage?
    var comp2: UIImage?
    var comp3: UIImage?
    var val1: String?
    var val2: String?
    var val3: String?
    
    
    init(name: String, position: String?, score: String?, image: UIImage?, comp1: UIImage?, comp2: UIImage?, comp3: UIImage?, val1: String?, val2: String?, val3: String?) {
        self.name = name
        self.position = position
        self.score = score
        self.image = image
        self.comp1 = comp1
        self.comp2 = comp2
        self.comp3 = comp3
        self.val1 = val1
        self.val2 = val2
        self.val3 = val3
        
    }
}
class FeedViewController: MenuContainerViewController, UITableViewDelegate, UITableViewDataSource{
    
    var playerTableView: UITableView!
    var players = [Player]()
    
    var menuButton: DynamicButton = DynamicButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func createTitleScreen(){
        let backImage = #imageLiteral(resourceName: "backgroundLight")
        let backImageResize = LoadingPage.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        self.view.backgroundColor = UIColor(patternImage: backImageResize)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTitleScreen()
        self.menuViewController = MenuView()
        
        /**menuButton.setStyle(.hamburger, animated: true)
        menuButton.lineWidth           = 3
        menuButton.strokeColor         = .black
        menuButton.highlightStokeColor = .gray
        menuButton.center.x = view.frame.width/9
        menuButton.center.y = view.frame.height/18
        menuButton.setTitle("Menu", for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonMethod), for: .touchUpInside)
        menuButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        view.addSubview(menuButton)**/

        
        /**menuButton.center.x = view.frame.width/1.15
        menuButton.center.y = view.frame.height/10
        menuButton.setTitle("Back", for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonMethod), for: .touchUpInside)
        menuButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        menuButton.titleLabel?.backgroundColor = .black**/
        
        menuButton.setStyle(.arrowLeft, animated: true)
        menuButton.lineWidth           = 3
        menuButton.strokeColor         = .black
        menuButton.highlightStokeColor = .gray
        
        let play = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(menuButtonMethod))
        navigationItem.leftBarButtonItem = play
        //navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: play, target: self, action: #selector(menuButtonMethod))
        //view.addSubview(menuButton)
        
        
        self.title = "League Leaderboards"
        
        playerTableView = UITableView(frame: view.frame)
        playerTableView.dataSource = self
        playerTableView.delegate = self
        playerTableView.rowHeight = 100
        playerTableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: "Reuse")
        playerTableView.separatorStyle = .none
        
        view.addSubview(playerTableView)
        
        generatePlayers()
        view.addSubview(menuButton)
        
    }
    func menuButtonMethod(){
        showSideMenu()
    }
    
    func generatePlayers() {
        
        let rob = Player(name: "Rob", position: "1", score: "178,690     (+78.69%)", image: #imageLiteral(resourceName: "robpic"), comp1: #imageLiteral(resourceName: "netflixpic"), comp2:#imageLiteral(resourceName: "bnymellonpic"), comp3: #imageLiteral(resourceName: "oraclepic"), val1: "5.49", val2: "5.10", val3: "3.68")
        let ohad = Player(name: "Ohad", position: "2", score: "142,500     (+42.50%)", image: #imageLiteral(resourceName: "ohadpic"), comp1: #imageLiteral(resourceName: "microsoftpic"), comp2:#imageLiteral(resourceName: "bnymellonpic"), comp3: #imageLiteral(resourceName: "netflixpic"), val1: "4.76", val2: "4.55", val3: "3.68")
        let ethan = Player(name: "Ethan", position: "3", score: "142,060     (+42.06%)", image: #imageLiteral(resourceName: "ethanpic"), comp1: #imageLiteral(resourceName: "capitalonepic"), comp2:#imageLiteral(resourceName: "microsoftpic"), comp3: #imageLiteral(resourceName: "jpmorganpic"), val1: "6.41", val2: "3.67", val3: "3.11")
        let matt = Player(name: "Matt", position: "4", score: "139,755     (+39.76%)", image: #imageLiteral(resourceName: "mattpic"), comp1: #imageLiteral(resourceName: "ibmpic"), comp2:#imageLiteral(resourceName: "netflixpic"), comp3: #imageLiteral(resourceName: "bnymellonpic"), val1: "4.63", val2: "3.85", val3: "3.55")
        let jessica = Player(name: "Jessica", position: "5", score: "126,680     (+26.68%)", image: #imageLiteral(resourceName: "jessicapic"), comp1: #imageLiteral(resourceName: "microsoftpic"), comp2:#imageLiteral(resourceName: "capitalonepic"), comp3: #imageLiteral(resourceName: "jpmorganpic"), val1: "5.86", val2: "5.30", val3: "4.55")
        let rebecca = Player(name: "Rebecca", position: "6", score: "125,430     (+25.43%)", image: #imageLiteral(resourceName: "rebeccapic"), comp1: #imageLiteral(resourceName: "bnymellonpic"), comp2:#imageLiteral(resourceName: "oraclepic"), comp3: #imageLiteral(resourceName: "capitalonepic"), val1: "3.86", val2: "3.56", val3: "3.11")
        let eric = Player(name: "Eric", position: "7", score: "123,210     (+23.21%)", image: #imageLiteral(resourceName: "ericpic"), comp1: #imageLiteral(resourceName: "capitalonepic"), comp2:#imageLiteral(resourceName: "microsoftpic"), comp3: #imageLiteral(resourceName: "applepic"), val1: "6.11", val2: "5.63", val3: "4.33")
        let sarah = Player(name: "Sarah", position: "8", score: "87,550     (-13.45%)", image: #imageLiteral(resourceName: "sarahpic"), comp1: #imageLiteral(resourceName: "microsoftpic"), comp2:#imageLiteral(resourceName: "netflixpic"), comp3: #imageLiteral(resourceName: "GoogleLogo"), val1: "5.31", val2: "4.99", val3: "3.01")
        let michael = Player(name: "Michael", position: "9", score: "85,430     (-14.57%)", image: #imageLiteral(resourceName: "michaelpic"), comp1: #imageLiteral(resourceName: "capitalonepic"), comp2:#imageLiteral(resourceName: "jpmorganpic"), comp3: #imageLiteral(resourceName: "netflixpic"), val1: "7.01", val2: "3.11", val3: "3.00")
        let chris = Player(name: "Chris", position: "10", score: "83,119     (-16.88%)", image: #imageLiteral(resourceName: "chrispic"), comp1: #imageLiteral(resourceName: "microsoftpic"), comp2:#imageLiteral(resourceName: "bnymellonpic"), comp3: #imageLiteral(resourceName: "GoogleLogo"), val1: "6.41", val2: "5.10", val3: "3.18")
        let daniel = Player(name: "Daniel", position: "11", score: "80,000     (-20.00%)", image: #imageLiteral(resourceName: "danielpic"), comp1: #imageLiteral(resourceName: "bnymellonpic"), comp2:#imageLiteral(resourceName: "sonypic"), comp3: #imageLiteral(resourceName: "oraclepic"), val1: "3.84", val2: "2.79", val3: "2.66")
        let maddie = Player(name: "Maddie", position: "12", score: "75,980     (-24.02%)", image: #imageLiteral(resourceName: "maddiepic"), comp1: #imageLiteral(resourceName: "jpmorganpic"), comp2:#imageLiteral(resourceName: "netflixpic"), comp3: #imageLiteral(resourceName: "microsoftpic"), val1: "6.01", val2: "5.10", val3: "3.09")

        let nolan = Player(name: "Nolan", position: "13", score: "67,850     (-33.15%)", image: #imageLiteral(resourceName: "nolanpic"), comp1: #imageLiteral(resourceName: "microsoftpic"), comp2:#imageLiteral(resourceName: "bnymellonpic"), comp3: #imageLiteral(resourceName: "oraclepic"), val1: "5.39", val2: "3.67", val3: "3.08")

        let keith = Player(name: "Keith", position: "14", score: "65,000     (-35.00%)", image: #imageLiteral(resourceName: "keithpic"), comp1: #imageLiteral(resourceName: "netflixpic"), comp2:#imageLiteral(resourceName: "capitalonepic"), comp3: #imageLiteral(resourceName: "microsoftpic"), val1: "6.30", val2: "5.39", val3: "2.98")

        let steve = Player(name: "Steve", position: "15", score: "58,790     (-42.21%)", image: #imageLiteral(resourceName: "stevepic"), comp1: #imageLiteral(resourceName: "bnymellonpic"), comp2:#imageLiteral(resourceName: "capitalonepic"), comp3: #imageLiteral(resourceName: "microsoftpic"), val1: "5.39", val2: "3.79", val3: "2.97")

        let erin = Player(name: "Erin", position: "16", score: "46,200     (-54.80%)", image: #imageLiteral(resourceName: "erinpic"), comp1: #imageLiteral(resourceName: "microsoftpic"), comp2:#imageLiteral(resourceName: "netflixpic"), comp3: #imageLiteral(resourceName: "oraclepic"), val1: "3.87", val2: "3.13", val3: "2.21")

        
        
        players = [rob, ohad, ethan, matt, jessica, rebecca, eric, sarah, michael, chris, daniel, maddie, nolan, keith, steve, erin]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = playerTableView.dequeueReusableCell(withIdentifier: "Reuse") as? PlayerTableViewCell {
            let player = players[indexPath.row]
            cell.setUpCellWithPlayer(profileImage: player.image, name: player.name, position: player.position, score: player.score)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let detailViewController = DetailViewController()
        detailViewController.player = players[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    /**func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            playerTableView.deleteRows(at: [indexPath], with: .fade)
            playerTableView.reloadData()
        }
    }**/

    override func viewDidAppear(_ animated: Bool) {
        playerTableView.reloadData()
    }



}

