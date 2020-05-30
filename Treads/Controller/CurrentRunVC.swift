//
//  CurrentRunVC.swift
//  Treads
//
//  Created by Mohamed Adel on 5/30/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit
import MapKit

class CurrentRunVC: LocationVC {
    // MARK: Outlets
    @IBOutlet private weak var swipeBGImageView: UIImageView!
    @IBOutlet private weak var sliderImageView: UIImageView!
    // MARK: Properties
    
    // MARK: View Controller Life Cycle
   

    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(endRunSwiped(sender:)))
               sliderImageView.addGestureRecognizer(swipeGesture)
               sliderImageView.isUserInteractionEnabled = true
               swipeGesture.delegate = self as? UIGestureRecognizerDelegate
        
    }
    // MARK: Action
    
    // MARK: Class Methods
    
    // MARK: Self Defined Methods
    @objc func endRunSwiped(sender: UIPanGestureRecognizer) {
        let minAdjust: CGFloat = 80
        let maxAdjust: CGFloat = 128
        if let sliderView = sender.view {
            if sender.state == UIGestureRecognizer.State.began || sender.state == UIGestureRecognizer.State.changed {
                let translation = sender.translation(in: self.view)
                if sliderView.center.x >= (swipeBGImageView.center.x - minAdjust) && sliderView.center.x <= (swipeBGImageView.center.x + maxAdjust) {
                    sliderView.center.x = sliderView.center.x + translation.x
                } else if sliderView.center.x >= (swipeBGImageView.center.x + maxAdjust) {
                    sliderView.center.x = swipeBGImageView.center.x + maxAdjust
                    //  End Run Code Goes Here
                    dismiss(animated: true, completion: nil)
                } else {
                    sliderView.center.x = swipeBGImageView.center.x - minAdjust
                }
                
                sender.setTranslation(CGPoint.zero, in: self.view)
            } else if sender.state == UIGestureRecognizer.State.ended {
                UIView.animate(withDuration: 0.1, animations: {
                    sliderView.center.x = self.swipeBGImageView.center.x - minAdjust
                })
            }
        }
    }
    
}
