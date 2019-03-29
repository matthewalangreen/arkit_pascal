//
//  Utilities.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/26/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit

func colorMixFunction(_ input: CGFloat) -> CGFloat {
    return sin(1.2*input)
}

func lerpColor(_ first: color, _ second: color, _ amount: CGFloat) -> UIColor {
    var r = (1.0 - amount) * first.red + amount * second.red
    var g = (1.0 - amount) * first.green + amount * second.green
    var b = (1.0 - amount) * first.blue + amount * second.blue
    
    // error checking for weird values...
    if (r < 0) { r = 0 }
    if (r > 1) { r = 1 }
    if (g < 0) { g = 0 }
    if (g > 1) { g = 1 }
    if (b < 0) { b = 0 }
    if (b > 1) { b = 1 }
    
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
}

func map(_ val: CGFloat, _ minA: CGFloat, _ maxA: CGFloat, _ minB: CGFloat, _ maxB: CGFloat) -> CGFloat {
    return (((val - minA) * (maxB - minB)) / (maxA - minA)) + minB
}

