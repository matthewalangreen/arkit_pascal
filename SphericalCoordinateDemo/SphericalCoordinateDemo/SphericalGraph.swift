//
//  SphericalGraph.swift
//  SphericalCoordinateDemo
//
//  Created by Matt Green on 3/29/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit

public class PolarGraph {
    //MARK:- Properties
    var a: CGFloat = 0.7 // 0.6 is default
    var period: CGFloat = CGFloat.pi / 2
    var theta: CGFloat = 0
    var alpha: CGFloat = 0
    var dotController: CGFloat = 50 // 50 is default
    var increment: CGFloat = 0
    //var size: CGFloat = 450
    var valueVectors = [CGVector]()
    var graphSize: CGFloat = 180
    var valueVectorIndex = 0
    
    //MARK:- Init
    init(_ val: CGFloat) {
        increment = self.period / self.dotController
        calculateValuePairs(val)
    }
    
    convenience init(_ val: CGFloat, _ graphSize: CGFloat) {
        self.init(val)
        increment = self.period / self.dotController
        self.graphSize = graphSize
        calculateValuePairs(val)
    }
    
    //MARK:- Methods
    func calculateValuePairs(_ val: CGFloat) {
        valueVectors.removeAll()
        for radians in stride(from: 0.0, to: .pi * 30, by: increment) {
            let tx = graphSize * sin(-val * radians)*cos(radians) + midX
            let ty = graphSize * sin(-val * radians)*sin(radians) + midY
            let vector = CGVector.init(dx: tx, dy: ty)
            valueVectors.append(vector)
        }
    }
    
    func getNextVector() -> CGVector {
        valueVectorIndex += 1;
        if (valueVectorIndex > valueVectors.count - 1) {
            valueVectorIndex = 0
        }
        return valueVectors[valueVectorIndex]
    }
    
    func getCorrespondingVector(_ dotArrayPosition: Int) -> CGVector {
        if (dotArrayPosition < valueVectors.count) {
            return valueVectors[dotArrayPosition]
        } else {
            return CGVector.init(dx: 0, dy: 0) // put at origin if issue
        }
    }
}

