//
//  Dot.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/26/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit
import SpriteKit

public class Dot: SKShapeNode {
    //MARK:- Properties
    
    // set in default init
    var velocity: CGVector = CGVector(dx: -11, dy: -11)
    var acceleration: CGVector = CGVector(dx: -11, dy: -11)
    var radius: CGFloat = CGFloat(Int.random(in: 2 ..< 18))
    //var lifespan: CGFloat = CGFloat(Int.random(in: 300 ..< 500))
    var lifespan: CGFloat = 400
    var maxForce: CGFloat = 1.2 // 0.4 is default
    var maxSpeed: CGFloat = 16 // 7 is default
    var radiusChange: CGFloat = 0.1 // 0.04 is default
    var deathRate: CGFloat = 0.2 // 0.8 is default
    var counter: Int = 0
    var growing: Bool = true
    
    // overwritten in convenience init
    var firstPoint: CGPoint = CGPoint.init(x: -11, y: -11)
    var location: CGVector = CGVector(dx: -11, dy: -11)
    var newLocation: CGVector = CGVector(dx: -11, dy: -11)
    var dotColor: UIColor = .orange
    
    override init() {
        super.init()
    }
    
    convenience init(firstPoint: CGPoint, dotColor: UIColor) {
        self.init()
        self.init(circleOfRadius: self.radius)
        self.firstPoint = firstPoint
        self.location = CGVector(dx: firstPoint.x, dy: firstPoint.y)
        self.position = firstPoint
        self.newLocation = location
        self.dotColor = dotColor
        self.fillColor = dotColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Methods
    func pulse() {
        counter += 1
        if(counter > 40) {
            counter = 0
            growing = !growing
            radiusChange = -1*radiusChange
        }
        self.xScale += radiusChange * 0.1
        self.yScale += radiusChange * 0.1
    }
    
    func age() {
        lifespan -= deathRate
        let relSpan = map(lifespan,300,500,0,1)
        self.alpha = relSpan
    }
    
    //MARK:- My Physics Stuff
    
    func applyForce(_ force: CGVector) {
        acceleration = acceleration.sum(force)
    }
    
    func applyPhysics() {
        self.velocity = velocity.sum(acceleration)
        //velocity.limit(maxSpeed);
        self.location = location.sum(velocity);
        self.acceleration = acceleration.multiply(0);
        self.position = CGPoint.init(x: self.location.dx, y: self.location.dy)
    }
    
    func arrive(_ target: CGVector) {
        var desired: CGVector = target.difference(location)
        let d = desired.length()
        desired = desired.normalize()
        
        if(d < 100) {
            let m: CGFloat = map(d, 0, 100, 0, maxSpeed)
            desired = desired.multiply(m)
        } else {
            desired = desired.multiply(maxSpeed)
        }
        
        let steer: CGVector = desired.difference(velocity)
        // steer.limit(maxForce)
        applyForce(steer)
    }
    
}

