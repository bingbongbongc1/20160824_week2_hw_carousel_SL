//
//  IntroViewController.swift
//  20160824_week2_hw_carousel_SL
//
//  Created by Leung, Shelley on 8/24/16.
//  Copyright © 2016 Leung, Shelley. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    // Arrays of initial transform values for tiles
    var xOffsets : [CGFloat] = [-75, 40, 15, 85, -115, -90]
    var yOffsets : [CGFloat] = [-285, -250, -420, -395, -520, -490]
    var scales : [CGFloat] = [1, 1.6, 1.65, 1.65, 1.65, 1.7]
    var rotations : [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.contentSize = introImage.image!.size
        
        introScrollView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Content offset: 0 -> 568
        let offset = CGFloat(introScrollView.contentOffset.y)
        
        // Transformation for tile 1
        let tx1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[0], r2Max: 0)
        let ty1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[0], r2Max: 0)
        let scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[0], r2Max: 1)
        let rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)

        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx1), CGFloat(ty1))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale1), CGFloat(scale1))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
        // Transformation for tile 2
        let tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[1], r2Max: 0)
        let ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[1], r2Max: 0)
        let scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[1], r2Max: 1)
        let rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[1], r2Max: 0)
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scale2), CGFloat(scale2))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotation2) * M_PI / 180))
        
        // Transformation for tile 3
        let tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[2], r2Max: 0)
        let ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[2], r2Max: 0)
        let scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[2], r2Max: 1)
        let rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[2], r2Max: 0)
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scale3), CGFloat(scale3))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        // Transformation for tile 4
        let tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[3], r2Max: 0)
        let ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[3], r2Max: 0)
        let scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[3], r2Max: 1)
        let rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[3], r2Max: 0)
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scale4), CGFloat(scale4))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        // Transformation for tile 5
        let tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[4], r2Max: 0)
        let ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[4], r2Max: 0)
        let scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[4], r2Max: 1)
        let rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[4], r2Max: 0)
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scale5), CGFloat(scale5))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        // Transformation for tile 6
        let tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[5], r2Max: 0)
        let ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[5], r2Max: 0)
        let scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[5], r2Max: 1)
        let rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[5], r2Max: 0)
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scale6), CGFloat(scale6))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotation6) * M_PI / 180))

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
