//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewPropertyAnimatorController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    var animator = UIViewPropertyAnimator(duration: 1.0, timingParameters: UISpringTimingParameters(mass: 2, stiffness: 30, damping: 7, initialVelocity: .zero))
    
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        guard !animator.isRunning else { return }
        switch recognizer.state {
        case .began:
            animator.addAnimations {
                self.animationView.frame.origin.x += 300
                self.animationView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.animationView.transform = self.animationView.transform.rotated(by: .pi)
            }
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: view).x / 300
        case .ended:
            if animationView.layer.presentation()?.position.x ?? 0  < view.layer.position.x {
                animator.isReversed = true
            }
            animator.startAnimation()
        default:
            ()
        }
    }
}
