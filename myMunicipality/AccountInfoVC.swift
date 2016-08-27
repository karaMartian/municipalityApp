//
//  AccountInfoVC.swift
//  myMunicipality
//
//  Created by Karabo Moloi on 2016/08/26.
//  Copyright © 2016 Karabo Moloi. All rights reserved.
//

import UIKit

class AccountInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    MARK: - Outlets
    
    @IBOutlet weak var ratesTableView: UITableView!
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var townLbl: UILabel!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var deedLbl: UILabel!
    
//    MARK: - TableData Source
//    create object that will be the structure in how the details are loaded on to view from db
//    all values are subject to change with obj
    
    var ratesCatagories = ["Amount Payable", "Basic Charged", "Rates p.a", "Tariff Rates", "Market Value", "Effective Date", "Unit", "Arrears"]

    var vals = ["6 401,66", "2 571,84", "3 829,82", "0,0162971", "235000", "2015/07/01", "301000000001810000000000000", "N/A"]

    var accNum = [20003740]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratesTableView.delegate = self
        ratesTableView.dataSource = self
        
        
        nameLbl.text = "TRANSNET PROP SOC LTD"
        townLbl.text = "BREYTEN TOWN"
        streetLbl.text = "10 HOY STREET"
        deedLbl.text = "T3432/1920"
        
//    MARK: - Blur Effect
        let blurEffect = UIBlurEffect(style: .Dark)
        let transView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect))
//        let blurView = UIVisualEffectView(effect: blurEffect)
        transView.frame = logoImg.bounds
        logoImg.addSubview(transView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratesCatagories.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Account Number: \(accNum[0])"
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ratesCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = ratesCatagories[indexPath.row]
        cell.detailTextLabel?.text = vals[indexPath.row]
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
