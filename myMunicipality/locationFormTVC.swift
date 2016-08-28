//
//  locationFormTVC.swift
//  myMunicipality
//
//  Created by Karabo Moloi on 2016/08/28.
//  Copyright © 2016 Karabo Moloi. All rights reserved.
//

import UIKit

class locationFormTVC: UITableViewController {
    
    var catTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = catTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

   
    @IBAction func cancel(sender: UIBarButtonItem){
        dismissViewControllerAnimated(true, completion: nil)
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
