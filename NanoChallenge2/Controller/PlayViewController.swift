//
//  PlayViewController.swift
//  NanoChallenge2
//
//  Created by Alexis Ruben Garcias Laborda on 02/02/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class PlayViewController: LevelViewController {
    
    @IBOutlet weak var btnTentarNovamente: UIButton!
    @IBOutlet weak var lblConseguiu: UILabel!
    
    var dynamicItems = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dynamicItems.append(playableChar.playableCharView)
        
        for obstacle in obstacles {
            
            dynamicItems.append(obstacle)            
            obstacle.backgroundColor = UIColor.clear
        }
        
        //dynamicItems.append(endRectangle)
        
        initializePhysics()
        
        newSwipeGesture(direction: .up, action: #selector(onSwipeUp(_:)))
        newSwipeGesture(direction: .left, action: #selector(onSwipeLeft(_:)))
        newSwipeGesture(direction: .right, action: #selector(onSwipeRight(_:)))
        
        btnTentarNovamente.isHidden = true
        lblConseguiu.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func initializePhysics() {
        
        let itemBehavior = UIDynamicItemBehavior(items: obstacles)
        itemBehavior.isAnchored = true
        itemBehavior.elasticity = 0
        
        animator.addBehavior(itemBehavior)
        
        let collision = UICollisionBehavior(items: dynamicItems)
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionDelegate = self
        
        animator.addBehavior(collision)
    }
    
    func newSwipeGesture(direction: UISwipeGestureRecognizerDirection, action: Selector?) {
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: action)
        swipeGesture.direction = direction
        
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc func onSwipeUp(_ sender: Any) {
        
        playableChar.applyForceUp()
    }
    
    @objc func onSwipeRight(_ sender: Any) {
        
        playableChar.moveRight()
    }
    
    @objc func onSwipeLeft(_ sender: Any) {

        playableChar.moveLeft()
    }
    
    @IBAction func btnTentarNovamenteTouched(_ sender: UIButton) {
        
        playableChar.backToStartPoint()
        
        btnTentarNovamente.isHidden = true
        lblConseguiu.isHidden = true
        
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false, block: { (_) in
            
            self.initializePhysics()
        })
    }
}

extension PlayViewController: UICollisionBehaviorDelegate {
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        
        if item2.isEqual(endRectangle) {
            
            playableChar.stop()
            lblConseguiu.isHidden = false
        }
        else {
            if item1.isEqual(self.playableChar.playableCharView) {
                
                playableChar.stop()
                btnTentarNovamente.isHidden = false
            }
        }
    }
    
}
