//
//  LevelViewController.swift
//  NanoChallenge2
//
//  Created by Alexis Laborda on 05/02/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    var obstacles = [UIView]()
    
    var playableChar: PlayableCharacter!
    var animator: UIDynamicAnimator!
    var endRectangle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        playableChar = PlayableCharacter(dynamicAnimator: animator, view: self.view)
        
        let level = LevelBEPiD()
        
        for obstacle in level.obstacles {
          
            let rectangle = UIView(frame: obstacle.rectangle)
            rectangle.backgroundColor = UIColor.orange
            
            let label = UILabel(frame: obstacle.rectangle)
            label.text = obstacle.description
            
            self.view.addSubview(rectangle)
            self.view.addSubview(label)
            
            obstacles.append(rectangle)
        }
        
        endRectangle = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        endRectangle.backgroundColor = UIColor.clear
        obstacles.append(endRectangle)
        
        self.view.addSubview(endRectangle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
