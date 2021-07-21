//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
    @IBOutlet weak var orangeView: UIView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handle(_:)))
            orangeView.addGestureRecognizer(tapGestureRecognizer)
            orangeView.tag = 0
        }
    }
    @IBOutlet weak var cyanView: UIView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handle(_:)))
            cyanView.addGestureRecognizer(tapGestureRecognizer)
            cyanView.tag = 1
        }
    }
    @IBOutlet weak var blueView: UIView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handle(_:)))
            blueView.addGestureRecognizer(tapGestureRecognizer)
            blueView.tag = 2
        }
    }
    @IBOutlet weak var greenView: UIView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handle(_:)))
            greenView.addGestureRecognizer(tapGestureRecognizer)
            greenView.tag = 3
        }
    }
    
    @objc func handle(_ gestureRecognizer: UITapGestureRecognizer) {
        switch gestureRecognizer.view?.tag {
        case 0:
            print("orang")
            let animation = CABasicAnimation(keyPath: "cornerRadius")
            animation.duration = 1
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            animation.fromValue = orangeView.layer.cornerRadius
            animation.toValue = orangeView.bounds.width/2
            orangeView.layer.cornerRadius = orangeView.bounds.width/2
            orangeView.layer.add(animation, forKey: "cornerRadius")
        case 1:
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.duration = 1
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
            animation.fromValue = cyanView.layer.opacity
            animation.toValue = 0
            cyanView.alpha = 0
            cyanView.layer.add(animation, forKey: "opacity")
            print("cyan")
        case 2:
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.fromValue = 0
            rotationAnimation.toValue = 7 * CGFloat.pi / 4
            rotationAnimation.duration = 2
            blueView.layer.add(rotationAnimation, forKey: "transform.rotation.z")
            
            let movingAnimation = CABasicAnimation(keyPath: "position.x")
            movingAnimation.duration = 2
            movingAnimation.fromValue = blueView.center.x
            movingAnimation.toValue = cyanView.center.x
         
            let groupAnimation = CAAnimationGroup()
            groupAnimation.animations = [rotationAnimation, movingAnimation]
            groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            groupAnimation.duration = 2
            blueView.layer.add(groupAnimation, forKey: "group")
            blueView.center.x = cyanView.center.x
            blueView.layer.transform = CATransform3DMakeRotation(7 * CGFloat.pi / 4, 0, 0, 1)
            print("blue")
        case 3:
            let positionAnimation = CABasicAnimation(keyPath: "position")
            positionAnimation.fromValue = greenView.center
            positionAnimation.toValue = view.center
            
            let sizeAnimation = CABasicAnimation(keyPath: "transform.scale")
            sizeAnimation.fromValue = 1
            sizeAnimation.toValue = 1.5
            
            let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
            colorAnimation.duration = 2
            colorAnimation.fromValue = greenView.backgroundColor?.cgColor
            colorAnimation.toValue = UIColor.magenta.cgColor
            
            let groupAnimation = CAAnimationGroup()
            groupAnimation.duration = 1
            groupAnimation.animations = [positionAnimation, colorAnimation, sizeAnimation]
            groupAnimation.autoreverses = true
            groupAnimation.repeatCount = 2
            groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
            greenView.layer.add(groupAnimation, forKey: "groupAnimation")
            print("green")
        default:
            print("other")
        }
    }
}
