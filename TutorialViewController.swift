//
//  TutorialViewController.swift
//  20160824_week2_hw_carousel_SL
//
//  Created by Leung, Shelley on 8/25/16.
//  Copyright © 2016 Leung, Shelley. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tutorialScrollView.contentSize = CGSize (width: 1280, height: 568)
        
        tutorialScrollView.delegate = self
        
        button.alpha = 0
        
        // Do any additional setup after loading the view.
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        //Upon reaching the 4th page, the page indicators disappear and the "Take for a spin" button fades in.
        if page == 3 {
            pageControl.hidden = true
            button.alpha = 1
        }
        else {
            pageControl.hidden = false
            button.alpha = 0
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
