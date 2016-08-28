//
//  SettingsViewController.swift
//  20160824_week2_hw_carousel_SL
//
//  Created by Leung, Shelley on 8/27/16.
//  Copyright © 2016 Leung, Shelley. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScrollView.contentSize = CGSize(width: 320, height: 695)
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tapClose(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tapSignOut(sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            // handle case of user logging out
            self.performSegueWithIdentifier("signOutSegue", sender: nil)
        }
        // add the logout action to the alert controller
        alertController.addAction(signOutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }

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
