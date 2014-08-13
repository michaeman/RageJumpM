//
//  GameScene.swift
//  SkipGame
//
//  Created by Michael on 11/08/2014.
//  Copyright (c) 2014 Michael Liu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let classic = SKSpriteNode(imageNamed: "Classic")
    let rush = SKSpriteNode(imageNamed: "Rush")
    let arcade = SKSpriteNode(imageNamed: "Arcade")
    let more = SKSpriteNode(imageNamed: "More")
    let multi = SKSpriteNode(imageNamed: "Multi")
    
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor.blackColor()
        
        self.classic.position = CGPointMake(CGRectGetMidX(self.frame) - 150, CGRectGetMidY(self.frame) + 50)
        self.addChild(self.classic)
        
        self.arcade.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 50)
        self.addChild(self.arcade)
        
        self.rush.position = CGPointMake(CGRectGetMidX(self.frame) + 150, CGRectGetMidY(self.frame) + 50)
        self.addChild(self.rush)
        
        self.more.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 100)
        self.addChild(self.more)
        
        self.multi.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 30)
        self.addChild(self.multi)
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if self.nodeAtPoint(location) == self.classic{
                
                var scene = ClassicMode(size: self.size)
                let skView = self.view as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
                
            }
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
