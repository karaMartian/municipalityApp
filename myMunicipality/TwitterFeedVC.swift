//
//  TwitterFeedVC.swift
//  myMunicipality
//
//  Created by Karabo Moloi on 2016/08/16.
//  Copyright © 2016 Karabo Moloi. All rights reserved.
//

import UIKit
import TwitterKit


class TwitterFeedVC: TWTRTimelineViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "fabric", APIClient: client)

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
