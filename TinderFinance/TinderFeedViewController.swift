//
//  TinderFeedViewController.swift
//  TinderFinance
//
//  Created by Ohad Koronyo
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//  Credit to Dennis Fedorko on 10/31/16 © 2016 org.cuappdev
//


import UIKit
import InteractiveSideMenu
import DynamicButton
import FaveButton
import PMAlertController


struct PurchasingPower {
    static var money = 100000
}
struct portfolioCompanies {
    static var comps = [String]()
}

class CompanyShort {
    
    var name: String
    var image: UIImage?
    
    init(name: String, image: UIImage?) {
        self.name = name
        self.image = image
    }
}

class TinderFeedViewController: MenuContainerViewController {
        
    var firstTouchLocation: CGPoint?
    var companies = [CompanyShort]()
    var cards = [TinderCardView]()
    var likedCompanies = [String]()
    var dislikedCompanies = [String]()
    var borderFrameView: UIImageView = UIImageView(frame: CGRect( x: 0, y: 0, width: 100, height: 100))
    var menuButton: DynamicButton = DynamicButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func faveButtonMethod(button: FaveButton){
        if cards.count > 0 {
        let card = cards[0]
        let alertVC = PMAlertController(title: "Super Invest!", description: "Would you like to invest in this company for $25,000?", image: UIImage(named: "like.png"), style: .alert)
        
        alertVC.addAction(PMAlertAction(title: "Cancel", style: .cancel, action: { () -> Void in
            self.dismiss(animated: true, completion: nil)
            button.isSelected = false
        }))
        
        alertVC.addAction(PMAlertAction(title: "Yes!", style: .default, action: { () in
            button.isSelected = false
            if  PurchasingPower.money - 25000 >= 0{

            card.removeFromSuperview()
            self.cards.remove(at: 0)
            let compName = card.nameLabel.text!
            self.likedCompanies.append(compName.components(separatedBy: " ").first!)
            PurchasingPower.money -= 25000
            } else{
                //print("Out Of Money!")
            }
            
        }))
        
        /**alertVC.addTextField { (textField) in
            textField?.placeholder = "Location..."
        }**/
        
        let delayInSeconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
        
        self.present(alertVC, animated: true, completion: nil)
        }
        } else{
            let delayInSeconds = 0.1
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            button.isSelected = false
            }
        }
        //invest
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(view.frame.height)
        //print(view.frame.width)
        createTitleScreen()
        //createMenuController()
        self.menuViewController = MenuView()

        menuButton.setStyle(.hamburger, animated: true)
        menuButton.lineWidth           = 3
        menuButton.strokeColor         = .black
        menuButton.highlightStokeColor = .gray
        menuButton.center.x = view.frame.width/9
        menuButton.center.y = view.frame.height/18
        menuButton.setTitle("Menu", for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonMethod), for: .touchUpInside)
        menuButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        view.addSubview(menuButton)
        
        
        let faveButton = FaveButton(
            frame: CGRect(x:0, y:0, width: 75, height: 75),
            faveIconNormal: UIImage(named: "star")
        )
        faveButton.delegate = self

        faveButton.center.x = view.frame.width/2
        faveButton.center.y = view.frame.height/1.06
        faveButton.selectedColor = UIColor(colorLiteralRed: 218/255, green: 165/255, blue: 32/255, alpha: 1)
        faveButton.tag = 5
        faveButton.addTarget(self, action: #selector(faveButtonMethod), for: .touchDown)
        view.addSubview(faveButton)

        
        
        borderFrameView = UIImageView(frame: CGRect(x:0, y: 0, width: view.frame.width * 0.9, height: view.frame.height * 0.8))
        borderFrameView.image = #imageLiteral(resourceName: "borderFrame")
        borderFrameView.center = self.view.center
        view.addSubview(borderFrameView)
        
        makeLabels()



        makeCard(logoName: "netflixpic", logoNameTitle: "Netflix Stock Analysis", sImage: #imageLiteral(resourceName: "NetflixMarket"), oNumber: 182.73, hNumber: 184.93, lNumber: 181.43, mCap: "77.83B", vString: "Medium", cNumber: "-0.15%", dText: "Netflix Inc. is an Internet subscription service for watching television shows and movies. Subscribers can instantly watch unlimited television shows and movies streamed over the Internet to their televisions, computers, and mobile devices and in the United States, subscribers can receive standard definition DVDs and Blu-ray Discs delivered to their homes.")
        makeCard(logoName: "itgpic", logoNameTitle: "ITG Stock Analysis", sImage: #imageLiteral(resourceName: "ITGMarket"), oNumber: 20.05, hNumber: 20.29, lNumber: 20.01, mCap: "690.08M", vString: "Medium", cNumber: "+0.50%", dText: "Investment Technology Group, Inc. offers electronic brokerage, securities trading platforms, analytics and investment research. The company offers pre-trade analysis, trade execution, data-driven investment research and post-trade evaluation services.")
        makeCard(logoName: "sonypic", logoNameTitle: "Sony Stock Analysis", sImage: #imageLiteral(resourceName: "sonyMarket"), oNumber: 38.45, hNumber: 38.68, lNumber: 38.36, mCap: "-", vString: "Medium", cNumber: "+0.78%", dText: "Sony Corporation manufactures audio, home video game consoles, communications, key device, and information technology products for the consumer and professional markets. The Company's other businesses include music, pictures, computer entertainment, and online businesses.")
        makeCard(logoName: "GoogleLogo.png", logoNameTitle: "Google Stock Analysis", sImage: #imageLiteral(resourceName: "googleMarket"), oNumber: 74.85, hNumber: 75.07, lNumber: 74.27, mCap: "649.49 B", vString: "Low", cNumber: "-0.28%", dText: "Alphabet Inc. operates as a holding company. The Company, through its subsidiaries, provides web-based search, advertisements, maps, software applications, mobile operating systems, consumer content, enterprise solutions, commerce, and hardware products.")
        makeCard(logoName: "microsoftpic", logoNameTitle: "Microsoft Stock Analysis", sImage: #imageLiteral(resourceName: "microsoftMarket"), oNumber: 74.83, hNumber: 75.39, lNumber: 74.07, mCap: "561.13B", vString: "Low", cNumber: "+0.72%", dText: "Microsoft Corporation develops, manufactures, licenses, sells, and supports software products. The Company offers operating system software, server application software, business and consumer applications software, software development tools, and Internet and intranet software. Microsoft also develops video game consoles and digital music entertainment devices.")
        makeCard(logoName: "applepic", logoNameTitle: "Apple Stock Analysis", sImage: #imageLiteral(resourceName: "appleMarket"), oNumber: 158.47, hNumber: 160.97, lNumber: 158.00, mCap: "815.39B", vString: "Low", cNumber: "+1.01%", dText: "Apple Inc. designs, manufactures, and markets personal computers and related personal computing and mobile communication devices along with a variety of related software, services, peripherals, and networking solutions. The Company sells its products worldwide through its online stores, its retail stores, its direct sales force, third-party wholesalers, and resellers.")
        makeCard(logoName: "oraclepic", logoNameTitle: "Oracle Stock Analysis", sImage: #imageLiteral(resourceName: "oracleMarket"), oNumber: 50.65, hNumber: 50.70, lNumber: 48.48, mCap: "206.67 B", vString: "Medium", cNumber: "-7.67%", dText: "Oracle Corporation supplies software for enterprise information management. The Company offers databases and relational servers, application development and decision support tools, and enterprise business applications. Oracle's software runs on network computers, personal digital assistants, set-top devices, PCs, workstations, minicomputers, mainframes, and massively parallel computers.")
        makeCard(logoName: "facebookpic", logoNameTitle: "Facebook Stock Analysis", sImage: #imageLiteral(resourceName: "facebookMarket"), oNumber: 170.88, hNumber: 172.34, lNumber: 170.26, mCap: "492.61B", vString: "Low", cNumber: "+0.40%", dText: "Facebook, Inc. operates a social networking website. The Company website allows people to communicate with their family, friends, and coworkers. Facebook develops technologies that facilitate the sharing of information, photographs, website links, and videos. Facebook users have the ability to share and restrict information based on their own specific criteria.")
        makeCard(logoName: "ibmpic", logoNameTitle: "IBM Stock Analysis", sImage: #imageLiteral(resourceName: "IBMMarket"), oNumber: 144.82, hNumber: 145.17, lNumber: 144.08, mCap: "135.28B", vString: "Medium", cNumber: "-0.49%", dText: "International Business Machines Corporation (IBM) provides computer solutions through the use of advanced information technology. The Company's solutions include technologies, systems, products, services, software, and financing. IBM offers its products through its global sales and distribution organization, as well as through a variety of third party distributors and resellers.")
        makeCard(logoName: "capitalonepic", logoNameTitle: "CapitalOne Stock Analysis", sImage: #imageLiteral(resourceName: "capitalOneMarket"), oNumber: 78.60, hNumber: 80.13, lNumber: 78.57, mCap: "40.83B", vString: "Low", cNumber: "+1.70%", dText: "Capital One Financial Corporation provides commercial banking services. The Bank accepts deposits and offers personal credit cards, investment products, loans, and online banking services. Capital One serves customers in the State of Virginia.")
        makeCard(logoName: "bnymellonpic", logoNameTitle: "BNY Stock Analysis", sImage: #imageLiteral(resourceName: "BNYMellonMarket"), oNumber: 51.10, hNumber: 51.67, lNumber: 50.99, mCap: "56.17B", vString: "Low", cNumber: "+0.84%", dText: "BNY Mellon Global Emerging Markets Fund is an open-end fund incorporated in Ireland. The Fund's objective is to achieve long-term capital growth. The Fund invests in equity and equity related securities of companies listed, traded, located in or deriving at least half of their revenue or income from emerging market countries.")
        makeCard(logoName: "jpmorganpic", logoNameTitle: "JPMorgan Stock Analysis", sImage: #imageLiteral(resourceName: "JPMorganMarket"), oNumber: 91.08, hNumber: 91.71, lNumber: 90.76, mCap: "332.76B", vString: "Low", cNumber: "+0.71%", dText: "JPMorgan Chase & Co. provides global financial services and retail banking. The Company provides services such as investment banking, treasury and securities services, asset management, private banking, card member services, commercial banking, and home finance. JP Morgan Chase serves business enterprises, institutions, and individuals.")
        
        
    }
    
    func makeCard(logoName: String, logoNameTitle: String, sImage: UIImage, oNumber: CGFloat, hNumber: CGFloat, lNumber: CGFloat, mCap: String, vString: String, cNumber: String, dText: String){
        
        let card = TinderCardView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.9, height: view.frame.height * 0.8))
        card.center = self.view.center
        card.setup(image: UIImage(named: logoName), name: logoNameTitle, dText: dText)
        card.stockImage = sImage
        card.openNumber = oNumber
        card.highNumber = hNumber
        card.lowNumber = lNumber
        card.marketCapNumber = mCap
        card.volatilityString = vString
        card.changeNumber = cNumber
        
        card.updateDesc()

        
        view.addSubview(card)
        
        cards.insert(card, at: 0)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            
            if cards.count != 0 && cards[0].frame.contains(location) {
                firstTouchLocation = location
            } else{
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            if let origin = firstTouchLocation {
                let card = cards[0]
                let offsetX = location.x - origin.x
                let offsetY = location.y - origin.y
                card.center = CGPoint(x: view.center.x + offsetX, y: view.center.y + offsetY)
                card.transform = CGAffineTransform(rotationAngle: offsetX / 10.0 * CGFloat(Double.pi) / 180.0)
                
                if offsetX > 0 {
                    card.nopeOverlayImageView.alpha = 0
                    card.likeOverlayImageView.alpha = offsetX / (view.frame.width / 3.0)
                } else {
                    card.likeOverlayImageView.alpha = 0
                    card.nopeOverlayImageView.alpha = abs(offsetX) / (view.frame.width / 3.0)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view), let _ = firstTouchLocation {
            let card = cards[0]
            if location.x < view.frame.width * 0.25 {
                //nope
                UIView.animate(withDuration: 0.25, animations: { 
                    card.center = CGPoint(x: -self.view.frame.width, y: card.center.y)
                    card.transform = CGAffineTransform.identity
                }, completion: { _ in
                    
                    let compName = card.nameLabel.text!
                    self.dislikedCompanies.append(compName.components(separatedBy: " ").first!)

                    //print(self.dislikedCompanies)
                    
                    
                    card.removeFromSuperview()
                    self.cards.remove(at: 0)
                })
            } else if card.center.x > view.frame.width * 0.75 {
                //like
                if  PurchasingPower.money - 5000 >= 0
                {
                    UIView.animate(withDuration: 0.25, animations: {
                        card.center = CGPoint(x: self.view.frame.width * 3.0 / 2.0, y: card.center.y)
                        card.transform = CGAffineTransform.identity
                    }, completion: { _ in
                        let compName = card.nameLabel.text!
                        self.likedCompanies.append(compName.components(separatedBy: " ").first!)

                        //print(self.likedCompanies)
                        PurchasingPower.money -= 5000
                    
                        card.removeFromSuperview()
                        self.cards.remove(at: 0)
                        
                    })
                } else {
                    UIView.animate(withDuration: 0.25, animations: {
                        card.transform = CGAffineTransform.identity
                        card.center = self.view.center
                        card.likeOverlayImageView.alpha = 0.0
                        card.nopeOverlayImageView.alpha = 0.0
                        self.detailMethod(card: card)
                    }, completion: { _ in
                        //print("Out Of Money")
                    })
                    }
            } else {
                //reset
                UIView.animate(withDuration: 0.25, animations: { 
                    card.transform = CGAffineTransform.identity
                    card.center = self.view.center
                    card.likeOverlayImageView.alpha = 0.0
                    card.nopeOverlayImageView.alpha = 0.0
                    self.detailMethod(card: card)
                })
            }
            
            firstTouchLocation = nil
        }
    }
    func menuButtonMethod(){
        portfolioCompanies.comps = likedCompanies
        showSideMenu()
        //print(PurchasingPower.money)
    }
    
    func createTitleScreen(){
        let backImage = #imageLiteral(resourceName: "backgroundLight")
        let backImageResize = LoadingPage.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        self.view.backgroundColor = UIColor(patternImage: backImageResize)
        
    }
    
    func detailMethod(card: TinderCardView){
        let detailedView = StockAnalysisView(sImage: card.stockImage , oNumber: card.openNumber, hNumber: card.highNumber, lNumber: card.lowNumber, mCapNumber: card.marketCapNumber, vString: card.volatilityString, cNumber: card.changeNumber)
        present(detailedView, animated: true) {}

    }
    
    func makeLabels(){
        let borderFrameTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        borderFrameTextLabel.text = "Out of Swipes"
        borderFrameTextLabel.textColor = .black
        borderFrameTextLabel.textAlignment = .center
        borderFrameTextLabel.center.x = view.frame.width/2
        borderFrameTextLabel.center.y = view.frame.height/2.5
        borderFrameTextLabel.font = UIFont.boldSystemFont(ofSize: 42)
        borderFrameTextLabel.textAlignment = .center
        view.addSubview(borderFrameTextLabel)
        
        let borderFrameTextLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        borderFrameTextLabel2.text = "Check Back Tomorrow!"
        borderFrameTextLabel2.textColor = .black
        borderFrameTextLabel2.textAlignment = .center
        borderFrameTextLabel2.center.x = view.frame.width/2
        borderFrameTextLabel2.center.y = view.frame.height/2.1
        borderFrameTextLabel2.font = UIFont.boldSystemFont(ofSize: 22)
        borderFrameTextLabel2.textAlignment = .center
        view.addSubview(borderFrameTextLabel2)
    }
    /**func createMenuController(){
        self.menuViewController = MenuView()
        self.contentViewControllers = TinderFeedViewController.contentControllers()
        //self.selectContentViewController(contentViewControllers.first!)
    }
    
    static func contentControllers() -> [MenuViewController] {
        var contentList = [MenuViewController]()
        let viewController = ViewController()
        let leaderboardsView = LeaderboardsView()
        contentList.append(viewController)
        contentList.append(leaderboardsView)
        return contentList
    
    }**/
    
}
