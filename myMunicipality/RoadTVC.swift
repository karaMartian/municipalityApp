//
//  RoadTVC.swift
//  myMunicipality
//
//  Created by Karabo Moloi on 2016/08/28.
//  Copyright © 2016 Karabo Moloi. All rights reserved.
//

import UIKit

class RoadTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        identify which cell is being pressed
//        deselect after selection
//        segue to form
//        pass on cell title to form
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            print(cell.textLabel?.text)
            performSegueWithIdentifier("roadSubmitSegue", sender: indexPath)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        
        if let id = segue.identifier {
            if id == "roadSubmitSegue" {
                let nav = segue.destinationViewController as! UINavigationController
                let locationForm : locationFormTVC = nav.topViewController as! locationFormTVC
                let indexPath: NSIndexPath = sender as! NSIndexPath
//                indexPath = self.tableView.indexPathForSelectedRow!
//                print("\(indexPath.row)")
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                locationForm.catTitle = cell?.textLabel?.text
            }
        }
        
    }

}
