//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        let animation1 = CATransition()
        animation1.delegate = self
        animation1.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        animation1.type = .moveIn
        animation1.duration = 1
        animation1.setValue(0, forKeyPath: "animationId")
        textLabel.text = "Sliding!"
        textLabel.textColor = .green
        textLabel.layer.add(animation1, forKey: nil)
    }
    
    func secondAnimationStart() {
        let animation2 = CATransition()
        animation2.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        animation2.type = .fade
        animation2.duration = 1
        textLabel.text = "Initial text"
        textLabel.textColor = .orange
        textLabel.layer.add(animation2, forKey: nil)
    }
}

extension CATransitionController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim.value(forKey: "animationId") as? Int == 0 {
            secondAnimationStart()
        }
    }
}
