//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
    private var angle = CGFloat.pi
    
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut) {
            self.animationView.frame.origin.x = self.view.bounds.width - self.animationView.bounds.width
            self.animationView.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
        }
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
            self.view.layer.transform = CATransform3DMakeRotation(self.angle, 0, 0, 1)
        } completion: { _ in
            self.angle = self.angle == CGFloat.pi ? CGFloat.pi * 2 : CGFloat.pi
        }
    }
}
