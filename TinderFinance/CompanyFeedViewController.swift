//
//  ViewController.swift
//  TableViewApp
//
//  Created by Robert Li on 9/16/17.
//  Copyright © 2017 Robert Li. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import DynamicButton


class Company {
    
    var name: String
    var number: String?
    var image: UIImage?
    var percent: String
    
    init(name: String, number: String?, percent: String, image: UIImage?) {
        self.name = name
        self.number = number
        self.percent = percent
        self.image = image
        
    }
}

class CompanyFeedViewController: MenuContainerViewController, UITableViewDelegate, UITableViewDataSource{
    
    var companyTableView: UITableView!
    var companiesnames = [Company]()
    var boughtcompanies = [String]()
    var companies = [Company]()
    
    func menuButtonMethod(){
        showSideMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuViewController = MenuView()
        
        view.backgroundColor = .white
        self.title = "My Portfolio"
        let play = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(menuButtonMethod))
        navigationItem.leftBarButtonItem = play
        
        companyTableView = UITableView(frame: view.frame)
        companyTableView.dataSource = self
        companyTableView.delegate = self
        companyTableView.rowHeight = 100
        companyTableView.register(CompanyTableViewCell.self, forCellReuseIdentifier:
            "Reuse")
        companyTableView.separatorStyle = .none
        companyTableView.bounces = true
        
        view.addSubview(companyTableView)
        
        generateCompanies()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        boughtcompanies = portfolioCompanies.comps
        
        for stocks in boughtcompanies{
            for names in companiesnames{
                if(names.name == (stocks)){
                    companies.append(names)
                    names.number = String(boughtcompanies.index(of: stocks)!+1)
                }
            }
        }
    }
    
    func generateCompanies() {
        
        let google = Company (name: "Google", number: "1", percent: "(+3.23%)", image: #imageLiteral(resourceName: "GoogleLogo"))
        let bny = Company(name: "BNY", number: "2", percent: "(+2.87%)", image: #imageLiteral(resourceName: "bnymellonpic"))
        let capitalone = Company(name: "CapitalOne", number: "3", percent: "(+2.77%)", image: #imageLiteral(resourceName: "capitalonepic"))
        let jpm = Company(name: "JPMorgan", number: "4", percent: "(+1.86%)", image: #imageLiteral(resourceName: "jpmorganpic"))
        let microsoft = Company(name: "Microsoft", number: "5", percent: "(+1.68%)", image: #imageLiteral(resourceName: "microsoftpic"))
        let oracle = Company(name: "Oracle", number: "6", percent: "(+1.12%)", image: #imageLiteral(resourceName: "oraclepic"))
        let itg = Company(name: "ITG", number: "7", percent: "(+0.99%)", image: #imageLiteral(resourceName: "itgpic"))
        let netflix = Company(name: "Netflix", number: "8", percent: "(-0.05%)", image: #imageLiteral(resourceName: "netflixpic"))
        let ibm = Company(name: "IBM", number: "9", percent: "(-0.87%)", image: #imageLiteral(resourceName: "ibmpic"))
        let apple = Company (name: "Apple", number: "10", percent: "(-1.23%)", image: #imageLiteral(resourceName: "applepic"))
        let sony = Company (name: "Sony", number: "11", percent: "(-1.24%)", image: #imageLiteral(resourceName: "sonypic"))
        let facebook = Company (name: "Facebook", number: "12", percent: "(-1.35%)", image: #imageLiteral(resourceName: "facebookpic"))
        
        
        companiesnames = [google, bny, capitalone, jpm, microsoft, oracle, itg, netflix, ibm, apple, sony, facebook]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = companyTableView.dequeueReusableCell(withIdentifier: "Reuse") as? CompanyTableViewCell {
            let company = companies[indexPath.row]
            cell.setUpCellWithCompany(profileImage: company.image, name: company.name, number: company.number, percent: company.percent)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    /**func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sell"
    }**/
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let button1 = UITableViewRowAction(style: .default, title: "Sell"){action, indexPath in
            
            PurchasingPower.money += 10000
            //print(PurchasingPower.money)
            self.boughtcompanies.remove(at: indexPath.row)
            self.companies.remove(at: indexPath.row)
            portfolioCompanies.comps = self.boughtcompanies
            self.companyTableView.deleteRows(at: [indexPath], with: .fade)
            self.companyTableView.reloadData()
            
        }
        button1.backgroundColor = UIColor.green
        return [button1]
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            companies.remove(at: indexPath.row)
            companyTableView.deleteRows(at: [indexPath], with: .fade)
            companyTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        companyTableView.reloadData()
    }
    
    
    
}

