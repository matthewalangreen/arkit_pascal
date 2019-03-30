//
//  Sphere.swift
//  SphericalCoordinateDemo
//
//  Created by Matt Green on 3/30/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit
import SceneKit

public class MGSphere: SCNSphere {
    //MARK:- Properties
    
    // set in default
    var velocity = SCNVector3(-11, -11, -11)
    var acceleration = SCNVector3(-11, -11, -11)
    //var radius: CGFloat = CGFloat(Int.random(in: 2 ..< 18))
    //var lifespan: CGFloat = CGFloat(Int.random(in: 300 ..< 500))
    var lifespan: CGFloat = 400
    var maxForce: CGFloat = 1.2 // 0.4 is default
    var maxSpeed: CGFloat = 16 // 7 is default
    var radiusChange: CGFloat = 0.1 // 0.04 is default
    var deathRate: CGFloat = 0.2 // 0.8 is default
    var counter: Int = 0
    var growing: Bool = true
    
    // overwritten in convenience init
    var firstPointVector = SCNVector3(-11, -11, -11)
    var location = SCNVector3(-11, -11, -11)
    var newLocation = SCNVector3(-11, -11, -11)
    var dotColor: UIColor = .orange
    
    override init() {
        super.init()
    }
    
    convenience init(firstPointVector: SCNVector3, sphereColor: UIColor) {
        self.init()
        self.init(radius: 2)
        self.firstPointVector = firstPointVector
        self.location = firstPointVector
        self.newLocation = firstPointVector
        self.materials.first?.diffuse.contents = sphereColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
