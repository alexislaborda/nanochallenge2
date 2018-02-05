//
//  LevelBEPiD.swift
//  NanoChallenge2
//
//  Created by Alexis Laborda on 05/02/2018.
//  Copyright © 2018 Alexis Laborda. All rights reserved.
//

import CoreGraphics

class LevelBEPiD: Level {
    
    override init() {
        super.init()
        
        addObstacle(obstacle: Obstacle(rectangle: CGRect(x: 120, y: 440, width: 250, height: 20), description: "Prova teórica"))
        addObstacle(obstacle: Obstacle(rectangle: CGRect(x: 0, y: 270, width: 150, height: 20), description: "Hackaton"))
        addObstacle(obstacle: Obstacle(rectangle: CGRect(x: 220, y: 270, width: 150, height: 20), description: "Hackaton"))
        addObstacle(obstacle: Obstacle(rectangle: CGRect(x: 0, y: 120, width: 250, height: 20), description: "Entrevista"))
    }
}
