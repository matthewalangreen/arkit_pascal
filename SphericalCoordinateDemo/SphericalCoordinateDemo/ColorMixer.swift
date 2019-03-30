//
//  ColorMixer.swift
//  tapCircleDemo
//
//  Created by Matt Green on 3/26/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit

typealias color = (red: CGFloat, green: CGFloat, blue: CGFloat)

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

public class ColorMixer {
    // data
    var x: CGFloat
    var limit: CGFloat
    var e: CGFloat
    
    var c1: color
    var c2: color
    var mix: UIColor = UIColor.black
    var temp: UIColor = UIColor.black
    
    var i: Int
    var indexDelta: Int = 1
    var arrCount: Int = 0
    
    var rawPalette: [color]
    
    // initializer
    init(colors: [color]) {
        rawPalette = colors
        x = 0
        limit = (5*CGFloat.pi) / 12
        i = 1
        arrCount = rawPalette.count
        e = 2.71828
        c1 = rawPalette[0]
        c2 = rawPalette[1]
    }
    
    func mixColors(delta: CGFloat) -> UIColor {
        x += delta
        if(x > limit) {
            x = 0
            if(i == arrCount - 2) {
                indexDelta = -1
            }
            
            if(i == 0) {
                indexDelta = 1
            }
            
            if(indexDelta == 1) {
                c1 = rawPalette[i]
                c2 = rawPalette[i+1]
            }
            
            if(indexDelta == -1) {
                c1 = rawPalette[i+1]
                c2 = rawPalette[i]
            }
            i += indexDelta
        }
        return lerpColor(c1,c2,x)
    }
    
}
