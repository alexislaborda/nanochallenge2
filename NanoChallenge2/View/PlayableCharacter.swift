//
//  PlayableCharacter.swift
//  NanoChallenge2
//
//  Created by Alexis Laborda on 05/02/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class PlayableCharacter {
    
    let playableCharStartPoint: CGPoint!
    var playableCharView: UIView!
    var dynamicAnimator: UIDynamicAnimator!
    
    var snapBehavior: UISnapBehavior!
    var continuousPushBehavior: UIPushBehavior!
    
    var itemBehavior: UIDynamicItemBehavior!
    
    var xPosition = 1
    
    init(dynamicAnimator: UIDynamicAnimator, view: UIView) {
        
        self.dynamicAnimator = dynamicAnimator
        
        self.playableCharStartPoint = CGPoint(x: view.bounds.midX, y: 550)
        
        let square = CGRect(x: playableCharStartPoint.x, y: playableCharStartPoint.y, width: 20, height: 20)
        
        self.playableCharView = UIView(frame: square)
        self.playableCharView.backgroundColor = UIColor.blue
        
        view.addSubview(self.playableCharView)
        
        self.continuousPushBehavior =  UIPushBehavior(items: [playableCharView], mode: .continuous)
        self.snapBehavior = UISnapBehavior(item: playableCharView, snapTo: CGPoint(x: 50, y: self.playableCharView.frame.midY))
        
        itemBehavior = UIDynamicItemBehavior(items: [self.playableCharView])
        itemBehavior.elasticity = 0
        itemBehavior.allowsRotation = false
        itemBehavior.density = 50
        
        dynamicAnimator.addBehavior(itemBehavior)
    }
    
    func moveLeft() {
        
        if self.xPosition == 0 {
            
            return
        }
        
        self.xPosition -= 1
        
        snapObject()
    }
    
    func moveRight() {
        
        if self.xPosition == 2 {
            
            return
        }
        
        self.xPosition += 1
        
        snapObject()
    }
    
    func snapObject() {
        
        var x: CGFloat!
        
        switch self.xPosition {
        case 0:
            x = 80
        
        case 1:
            x = playableCharStartPoint.x
        
        case 2:
            x = 300
            
        default:
            return
        }
        
        dynamicAnimator.removeBehavior(self.snapBehavior)
        
        self.snapBehavior = UISnapBehavior(item: playableCharView, snapTo: CGPoint(x: x, y: self.playableCharView.frame.minY))
        self.snapBehavior.damping = 0.5
        
        dynamicAnimator.addBehavior(self.snapBehavior)
        
        Timer.scheduledTimer(withTimeInterval: 0.35, repeats: false, block: { (_) in
            
            self.dynamicAnimator.removeBehavior(self.snapBehavior)
        })
    }
    
    
    func applyForceUp() {
        
        dynamicAnimator.removeBehavior(self.continuousPushBehavior)
        
        let p = CGPoint(x: self.playableCharView.frame.midX, y: 0)
        let o = CGPoint(x: self.playableCharView.frame.midX, y: self.playableCharView.frame.minY);
        var distance = sqrtf(powf(Float(p.x-o.x), 2.0)+powf(Float(p.y-o.y), 2.0));
        let angle = atan2(p.y-o.y, p.x-o.x);
        
        distance = min(distance, 300.0); // velocidade
        
        continuousPushBehavior.magnitude = CGFloat(distance / 100.0)
        continuousPushBehavior.angle = angle
        
        dynamicAnimator.addBehavior(continuousPushBehavior)
    }
 
    func stop() {
        
        dynamicAnimator.removeAllBehaviors()
    }
    
    func backToStartPoint() {
        
        dynamicAnimator.removeAllBehaviors()
        
        self.snapBehavior = UISnapBehavior(item: playableCharView, snapTo: playableCharStartPoint)
        self.snapBehavior.damping = 0.5
        
        dynamicAnimator.addBehavior(self.snapBehavior)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            self.dynamicAnimator.removeBehavior(self.snapBehavior)
            self.dynamicAnimator.addBehavior(self.itemBehavior)
        })
    }
}
