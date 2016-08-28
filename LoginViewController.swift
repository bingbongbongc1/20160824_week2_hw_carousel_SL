//
//  LoginViewController.swift
//  20160824_week2_hw_carousel_SL
//
//  Created by Leung, Shelley on 8/24/16.
//  Copyright © 2016 Leung, Shelley. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!

    
    // Define variables for the initial position of the buttonParentView
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    func keyboardWillShow(notification: NSNotification!) {
        
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        // Scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
        
    }
    
    
    func keyboardWillHide (notification: NSNotification!) {
        
        // Return to original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginScrollView.delegate = self
            
        // Set the scroll view content size
        loginScrollView.contentSize = loginScrollView.frame.size
            
        // Set the content insets
        loginScrollView.contentInset.bottom = 100
        
        // Define how far the sign in button needs to move up
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        // Register for keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }


    @IBAction func tapLoginButton(sender: AnyObject) {
        self.checkIfFieldIsEmpty()
    }
    
    
    func checkIfFieldIsEmpty() {
        
        //If either of the email or password fields are empty, show an error alert
        if emailField.text!.isEmpty || passField.text!.isEmpty {
            
            let alertController = UIAlertController(title: nil, message: "Please enter your email or password.", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alertController.addAction(okAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
            
        //If there is text in both fields when the Sign In Button is pressed, show the Activity Indicator in the button.

        else {
            // Start animating the activity indicator
            loginIndicator.startAnimating()
            
            // Delay for 2 second to mimic validating 
            delay(2) {
                //If the email & password are correct, launch welcome screens.
                if self.emailField.text == "abcd@c1.com" && self.passField.text == "1234" {
                    self.performSegueWithIdentifier("tutorialSegue", sender: nil)
        
            
                }
                
                // Display alert
                else {
                    
                    let alert = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid email and password.", preferredStyle: .Alert)
                    
                    let yesAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    
                    alert.addAction(yesAction)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    self.loginIndicator.stopAnimating()

                
                }
            }
        }
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // The scrollView is in the process of scrolling...
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if loginScrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 80% of original size
        let transform = CGAffineTransformMakeScale(0.8, 0.8)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    @IBAction func tapBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
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

