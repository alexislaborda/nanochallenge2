//
//  Level.swift
//  NanoChallenge2
//
//  Created by Alexis Laborda on 05/02/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import CoreGraphics

struct Obstacle {
    var rectangle: CGRect!
    var description: String!
    
    init(rectangle: CGRect, description: String) {
        self.rectangle = rectangle
        self.description = description
    }
}

class Level {
    
    var obstacles = [Obstacle]()
    
    init() {
     
    }
    
    func addObstacle(obstacle: Obstacle) {
        
        obstacles.append(obstacle)
    }
}
