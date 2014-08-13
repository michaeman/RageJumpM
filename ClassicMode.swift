//
//  PlayScene.swift
//  SkipGame
//
//  Created by Michael on 11/08/2014.
//  Copyright (c) 2014 Michael Liu. All rights reserved.
//Committ

import SpriteKit

class ClassicMode: SKScene{
    
    let ground = SKSpriteNode(imageNamed: "startGround")
    let character1 = SKSpriteNode(imageNamed: "hero")
    let platform1 = SKSpriteNode(imageNamed: "Platform")
    let platform2 = SKSpriteNode(imageNamed: "Platform")
    let platform3 = SKSpriteNode(imageNamed: "Platform")
    let platform4 = SKSpriteNode(imageNamed: "Platform")
    let platform5 = SKSpriteNode(imageNamed: "Platform")
    let platform6 = SKSpriteNode(imageNamed: "Platform")
    
    var MoveLeft = false
    var MoveRight = false
    var StopSideMovement = false
    
    var SideMovement = CGFloat(1.5)
    
//    var initialRunningFirePosX = CGFloat(0)
//    var maxFireX = CGFloat(0)
//    var groundSpeed = 2
    
    var characterBaseLine = CGFloat(0)
    var OnGround = false
    var belowScreen = CGFloat(-50)
    var PlatformMoveDown = CGFloat(0.1)
    
    enum CollideType:UInt32 {
        case character = 1
        case ground = 2
    }
    
    override func didMoveToView(view: SKView!){
        
        
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.8)
        
        self.backgroundColor = UIColor.blackColor()
//        self.ground.anchorPoint = CGPointMake(0, 0.5)
        self.ground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(self.frame) + (self.ground.size.height/2))
        self.ground.physicsBody = SKPhysicsBody(rectangleOfSize: self.ground.size)
        self.ground.physicsBody.dynamic = false
        self.ground.physicsBody.affectedByGravity = false
        self.ground.physicsBody.categoryBitMask = CollideType.ground.toRaw()
        self.ground.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.ground.physicsBody.collisionBitMask = CollideType.character.toRaw()
        self.addChild(ground)
        
        self.platform1.position = CGPointMake(CGRectGetMinX(self.frame) + 230, CGRectGetMinY(self.frame) + 75)
        self.platform1.physicsBody = SKPhysicsBody(rectangleOfSize: self.platform1.size)
        self.platform1.physicsBody.dynamic = false
        self.platform1.physicsBody.affectedByGravity = false
        self.platform1.physicsBody.categoryBitMask = CollideType.ground.toRaw()
        self.platform1.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.platform1.physicsBody.collisionBitMask = CollideType.character.toRaw()
        self.addChild(platform1)
        
        self.platform2.position = CGPointMake(CGRectGetMidX(self.frame) - 220,CGRectGetMaxY(self.frame) - 30)
        self.platform2.physicsBody = SKPhysicsBody(rectangleOfSize: self.platform2.size)
        self.platform2.physicsBody.dynamic = false
        self.platform2.physicsBody.affectedByGravity = false
        self.platform2.physicsBody.categoryBitMask = CollideType.ground.toRaw()
        self.platform2.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.platform2.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.addChild(platform2)

        self.platform3.position = CGPointMake(CGRectGetMaxX(self.frame) - 100,CGRectGetMaxY(self.frame))
        self.platform3.physicsBody = SKPhysicsBody(rectangleOfSize: self.platform3.size)
        self.platform3.physicsBody.dynamic = false
        self.platform3.physicsBody.affectedByGravity = false
        self.platform3.physicsBody.categoryBitMask = CollideType.ground.toRaw()
        self.platform3.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.platform3.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.addChild(platform3)

        self.platform4.position = CGPointMake(CGRectGetMaxX(self.frame) - 200,CGRectGetMidY(self.frame) + 100)
        self.platform4.physicsBody = SKPhysicsBody(rectangleOfSize: self.platform4.size)
        self.platform4.physicsBody.dynamic = false
        self.platform4.physicsBody.affectedByGravity = false
        self.platform4.physicsBody.categoryBitMask = CollideType.ground.toRaw()
        self.platform4.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.platform4.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.addChild(platform4)

        self.platform5.position = CGPointMake(CGRectGetMidX(self.frame) + 40,CGRectGetMidY(self.frame) + 10)
        self.platform5.physicsBody = SKPhysicsBody(rectangleOfSize: self.platform5.size)
        self.platform5.physicsBody.dynamic = false
        self.platform5.physicsBody.affectedByGravity = false
        self.platform5.physicsBody.categoryBitMask = CollideType.ground.toRaw()
        self.platform5.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.platform5.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.addChild(platform5)
        
        self.platform6.position = CGPointMake(CGRectGetMidX(self.frame) - 80,CGRectGetMaxY(self.frame) - 30)
        self.platform6.physicsBody = SKPhysicsBody(rectangleOfSize: self.platform6.size)
        self.platform6.physicsBody.dynamic = false
        self.platform6.physicsBody.affectedByGravity = false
        self.platform6.physicsBody.categoryBitMask = CollideType.ground.toRaw()
        self.platform6.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.platform6.physicsBody.contactTestBitMask = CollideType.character.toRaw()
        self.addChild(platform6)

        
        
        self.character1.setScale(0.5)
        self.characterBaseLine = self.ground.position.y + (self.ground.size.height/2) + (self.character1.size.height/2)
        self.character1.position = CGPointMake(CGRectGetMidX(self.frame), self.characterBaseLine)
        self.character1.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.character1.size.width/2))
        self.character1.physicsBody.affectedByGravity = true
        self.character1.physicsBody.dynamic = true
        self.character1.physicsBody.allowsRotation = true
        self.character1.physicsBody.restitution = 0.0
//        self.character1.physicsBody.angularVelocity = 0.1
        self.character1.physicsBody.categoryBitMask = CollideType.character.toRaw()
        self.character1.physicsBody.contactTestBitMask = CollideType.ground.toRaw()
        self.character1.physicsBody.collisionBitMask = CollideType.ground.toRaw()
        
        self.addChild(character1)
        
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: "jump:")
        upSwipe.direction = UISwipeGestureRecognizerDirection.Up
        view.addGestureRecognizer(upSwipe)
        
//        let distanceToMove = CGFloat(self.frame.size.width + 2.0 * platform1.size.width)
//        let movePlatforms = SKAction.moveByX(0.0, y: distanceToMove, duration: NSTimeInterval(0.01 * distanceToMove))
//        let removePlatforms = SKAction.removeFromParent()
//        
//        let platformsMoveAndRemove = SKAction.sequence([movePlatforms, removePlatforms])
//        
//        //spawn platforms
//        
//        let spawn = SKAction.runBlock({() in self.spawnPlatforms()})
//        let delay = SKAction.waitForDuration(NSTimeInterval(2.0))
//        let spawnThenDelay = SKAction.sequence([spawn,delay])
//        let spawnThenDelayForever = SKAction.repeatActionForever(spawnThenDelay)
//        self.runAction(spawnThenDelayForever)
        

    }
    
    func died(){
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene{
            let skView = self.view as SKView
            skView.ignoresSiblingOrder = true
            scene.size = skView.bounds.size
            scene.scaleMode = .AspectFill
            skView.presentScene(scene)
        }
        
    }

    
    @IBAction func jump(sender: AnyObject) {
        
        MoveLeft = false
        MoveRight = false
        StopSideMovement = true
        
        if self.OnGround {
            
            character1.physicsBody.velocity = CGVectorMake(0, 0)
            character1.physicsBody.applyImpulse(CGVectorMake(0, 15))
            
            self.OnGround = false
        }
    }
    
    
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if location.x < self.character1.position.x {
                
                MoveLeft = true
            }
                
            else
            {
                MoveRight = true
            }
        }
    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        
        MoveLeft = false
        MoveRight = false
        StopSideMovement = true
    }
    func PlatformMovement(){
        
        ground.position = CGPointMake(ground.position.x, ground.position.y - PlatformMoveDown);
        platform1.position = CGPointMake(platform1.position.x, platform1.position.y - PlatformMoveDown);
        platform2.position = CGPointMake(platform2.position.x, platform2.position.y - PlatformMoveDown);
        platform3.position = CGPointMake(platform3.position.x, platform3.position.y - PlatformMoveDown);
        platform4.position = CGPointMake(platform4.position.x, platform4.position.y - PlatformMoveDown);
        platform5.position = CGPointMake(platform5.position.x, platform5.position.y - PlatformMoveDown);
        platform6.position = CGPointMake(platform6.position.x, platform6.position.y - PlatformMoveDown);
        
    }
    func PlatformFall() {
    
        if (character1.position.y > 500){
            PlatformMoveDown = 1;
        }
        else if (character1.position.y > 450){
            PlatformMoveDown = 2;
        }
        else if (character1.position.y > 400){
            PlatformMoveDown = 4;
        }
        else if (character1.position.y > 300){
            PlatformMoveDown = 5;
        }
        else if (character1.position.y > 250){
            PlatformMoveDown = 6;
        }
    
    }
    
    
    override func update(currentTime: NSTimeInterval) {
        
        self.PlatformMovement()
        
        if (self.character1.position.y < belowScreen){
            
            self.died()
            
        }
        
        
//        var rotation = CDouble(self.SideMovement*5) * M_PI/180
        
        if CGRectIntersectsRect(self.character1.frame, self.ground.frame){
            self.OnGround = true
        }
        else if CGRectIntersectsRect(self.character1.frame, self.platform1.frame){
            self.OnGround = true
        }
        else if CGRectIntersectsRect(self.character1.frame, self.platform2.frame){
            self.OnGround = true
        }
        else if CGRectIntersectsRect(self.character1.frame, self.platform3.frame){
            self.OnGround = true
        }
        else if CGRectIntersectsRect(self.character1.frame, self.platform4.frame){
            self.OnGround = true
        }
        else if CGRectIntersectsRect(self.character1.frame, self.platform5.frame){
            self.OnGround = true
        }
        else if CGRectIntersectsRect(self.character1.frame, self.platform6.frame){
            self.OnGround = true
        }
        else {
            self.OnGround = false
        }
        
        
        
        if (character1.position.x < CGRectGetMinX(self.frame))
        {
            character1.position = CGPointMake(CGRectGetMaxX(self.frame), character1.position.y)
        }
        
        if (character1.position.x > CGRectGetMaxX(self.frame))
        {
            character1.position = CGPointMake(CGRectGetMinX(self.frame), character1.position.y)
        }

        if MoveLeft == true {
//            character1.position = CGPointMake(character1.position.x - SideMovement, character1.position.y)
//            character1.zRotation += CGFloat(rotation)
            self.character1.physicsBody.applyImpulse(CGVectorMake(-0.2, 0))
            
        }
        if MoveRight == true{
//            character1.position = CGPointMake(character1.position.x + SideMovement, character1.position.y)
//            character1.zRotation -= CGFloat(rotation)
            self.character1.physicsBody.applyImpulse(CGVectorMake(0.2, 0))
        }
        
        
        // Platforms respawn
        
        if (platform1.position.y < -30){
            platform1.position.y = CGRectGetMaxY(self.frame)
        }
        if (platform2.position.y < -30){
            platform2.position.y = CGRectGetMaxY(self.frame)
        }
        if (platform3.position.y < -30){
            platform3.position.y = CGRectGetMaxY(self.frame)
        }
        if (platform4.position.y < -30){
            platform4.position.y = CGRectGetMaxY(self.frame)
        }
        if (platform5.position.y < -30){
            platform5.position.y = CGRectGetMaxY(self.frame)
        }

    }
    
}
