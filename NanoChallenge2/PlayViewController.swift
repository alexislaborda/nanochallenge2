//
//  PlayViewController.swift
//  NanoChallenge2
//
//  Created by Alexis Ruben Garcias Laborda on 02/02/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var imgSpaceship: UIImageView!
    
    var obstacle: UIView!
    
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let square = CGRect(x: 100, y: 300, width: 100, height: 100)
        
        self.obstacle = UIView(frame: square)
        self.obstacle.backgroundColor = UIColor.brown
        
        self.view.addSubview(self.obstacle)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func onSwipeUp(_ sender: Any) {
        
        UIView.animate(withDuration: 2) {
            self.imgSpaceship.frame.origin.y = 0
        }
        
    }
    
    @IBAction func onSwipeRight(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            self.imgSpaceship.frame.origin.x = 200
        }
    }
    
    @IBAction func onSwipeLeft(_ sender: Any) {

        UIView.animate(withDuration: 0.5) {
            self.imgSpaceship.frame.origin.x = -150
        }
    }
}
