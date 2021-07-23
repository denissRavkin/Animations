//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
    
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!
    var dynamicAnimator: UIDynamicAnimator!
    var anchorPoint: CGPoint!
    var attachment: UIAttachmentBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anchorPoint = anchorView.center
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [animationView])
        attachment = UIAttachmentBehavior(item: animationView, attachedToAnchor: anchorPoint)
        dynamicAnimator.addBehavior(attachment)
        dynamicAnimator.addBehavior(gravity)
    }
    
    @IBAction func handle(_ sender: UIPanGestureRecognizer) {
        anchorView.center = sender.location(in: view)
        attachment.anchorPoint = anchorView.center
    }
}
