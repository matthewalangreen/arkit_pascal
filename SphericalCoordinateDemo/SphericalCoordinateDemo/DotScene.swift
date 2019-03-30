////
////  DotScene.swift
////  tapCircleDemo
////
////  Created by Matt Green on 3/11/19.
////  Copyright © 2019 Matt Green. All rights reserved.
////
//
//import SpriteKit
//
//let bounds = UIScreen.main.bounds
//let width = bounds.width
//let height = bounds.height
//let midX = width / 2
//let midY = height / 2
//
//var curveIndex: Int = 0
//let colorMixer: ColorMixer = ColorMixer.init(colors: palette)
////let myGraph: PolarGraph = PolarGraph.init(0.2)
//let myGraph: PolarGraph = PolarGraph.init(0.2, height * 0.4)
//
//
//
//var moving: Bool = true
//
//class DotScene: SKScene {
//    
//    //let cameraNode = SKCameraNode()
//    
//    var aVals: [CGFloat] = [0.2,0.35,0.4,0.5,4,0.6,0.75,1.4,2,3];
//    
//    let colors = [SKColor.yellow, SKColor.red, SKColor.blue, SKColor.purple]
//    
//    var dots: [Dot] = []
//    
//    func changeCurve() {
//        curveIndex += 1
//        if(curveIndex > aVals.count - 1) {
//            curveIndex = 0
//        }
//        myGraph.calculateValuePairs(aVals[curveIndex])
//    }
//    
//    func changeCurve(_ value: CGFloat) {
//        myGraph.calculateValuePairs(value)
//    }
//    
//    func addDot(point: CGPoint) {
//        let nextColor = colorMixer.mixColors(delta: 0.05)
//        let dot = Dot.init(firstPoint: point, dotColor: nextColor)
//        dot.fillColor = nextColor
//        dot.position = point
//        dot.lineWidth = 0
//        dot.newLocation = CGVector.init(dx: midX, dy: midY)
//        dots.append(dot)
//        addChild(dot)
//        // print("parent: \(dot.parent!)")
//        //print("new dot at \(dotObject.position)")
//    }
//    
//    //MARK:- Touches
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        //print(touches.count)
//        let location = touch.location(in: self)
//        addDot(point: location)
//    }
//    
//    //MARK:- Override
//    override func update(_ currentTime: TimeInterval) {
//        //print(self.children.count)
//        //print("dots: \(dots.count)")
//        
//        // print("Vectors: \(myGraph.valueVectors.count) vector index: \(myGraph.valueVectorIndex)")
//        // let bounds = UIScreen.m
//        //let centerPointVector = CGVector.init(dx: midX, dy: midY)
//        
//        for (index,dot) in dots.enumerated() {
//            dot.applyPhysics()
//            dot.pulse()
//            dot.age()
//            
//            // if dot dies
//            if (dot.alpha <= 0) {
//                if(index < dots.count) {
//                    dots.remove(at: index)
//                    dot.removeFromParent()
//                }
//            }
//            
//            if(moving) {
//                dot.arrive(myGraph.getCorrespondingVector(index))
//            }
//            
//        }
//        
//    }
//    
//}
//
//
//
//
