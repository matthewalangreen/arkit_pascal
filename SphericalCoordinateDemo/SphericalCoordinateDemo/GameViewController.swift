//
//  GameViewController.swift
//  SphericalCoordinateDemo
//
//  Created by Matt Green on 3/29/19.
//  Copyright © 2019 Matt Green. All rights reserved.
//

import UIKit
import SceneKit

var scnView: SCNView!
var scnScene: SCNScene!
var cameraNode: SCNNode!

let bounds = UIScreen.main.bounds
let width = bounds.width
let height = bounds.height
let midX = width / 2
let midY = height / 2

let palette: [color] = [
    (194/255,86/255,119/255),
    (199/255,122/255,159/255),
    (178/255,116/255,158/255),
    (157/255,111/255,156/255),
    (139/255,108/255,155/255),
    (125/255,110/255,160/255),
    (117/255,114/255,163/255),
    (81/255,90/255,157/255),
    (118/255,145/255,199/255),
    (101/255,174/255,208/255),
    (92/255,153/255,169/255),
    (99/255,172/255,171/255),
    (255/255,131/255,0/255),
    (100/255,170/255,154/255),
    (105/255,166/255,142/255),
    (106/255,166/255,130/255)
]

var curveIndex: Int = 0
let colorMixer: ColorMixer = ColorMixer.init(colors: palette)
let myGraph: PolarGraphWithZ = PolarGraphWithZ.init(0.2, height * 0.4)

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
        //makeFirstSphere()
        let loc = SCNVector3(midX,midY,0)
        let loc2 = SCNVector3(0,10,0)
        let loc3 = SCNVector3(0,-10,0)
        let loc4 = SCNVector3(10,0,0)
        let loc5 = SCNVector3(-10,0,0)
        makeSimpleSphere(atVector: loc)
        makeSimpleSphere(atVector: loc2)
        makeSimpleSphere(atVector: loc3)
        makeSimpleSphere(atVector: loc4)
        makeSimpleSphere(atVector: loc5)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupView() {
        scnView = self.view as! SCNView
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = true
        scnView.delegate = self
        scnView.isPlaying = true
    }
    
    func setupScene() {
        scnScene = SCNScene.init()
        scnView.scene = scnScene
        //scnScene.background.contents.
    }
    
    func setupCamera() {
        let myScreenSize: CGRect = UIScreen.main.bounds
        let myScreenHeight = myScreenSize.height
        let cameraPosition = Float(myScreenHeight) * 0.01
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        //cameraNode.position = SCNVector3(x: 0, y: cameraPosition, z: 15)
        cameraNode.position = SCNVector3(x: Float(midX), y: Float(midY), z: 100)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func makeFirstSphere() {
        let geometry = SCNSphere(radius: 1.0)
        geometry.materials.first?.diffuse.contents = UIColor.red
        let sphereNode = SCNNode(geometry: geometry)
        let position = SCNVector3(x: 0, y: 0, z: 0)
        sphereNode.position = position
        scnScene.rootNode.addChildNode(sphereNode)
        print("makeFirstSphere called")
    }
    
//    func makeSphere(atVector: SCNVector3) {
//        let nextColor = colorMixer.mixColors(delta: 0.05)
//        let sphereGeometry = MGSphere.init(firstPointVector: atVector, sphereColor: nextColor)
//        let sphereNode = SCNNode(geometry: sphereGeometry)
//        sphereNode.position = atVector
//        scnScene.rootNode.addChildNode(sphereNode)
//        print("Nodes: \(scnScene.rootNode.childNodes.count), position: \(atVector)")
//    }
    
    func makeSimpleSphere(atVector: SCNVector3) {
        let geometry = SCNSphere(radius: 2.0)
        geometry.materials.first?.diffuse.contents = UIColor.orange
        let sphereNode = SCNNode(geometry: geometry)
        sphereNode.position = atVector
        scnScene.rootNode.addChildNode(sphereNode)
        print("simple sphere")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: scnView)
        let touchLocationVector = SCNVector3(location.x, location.y, 0)
        //makeSphere(atVector: touchLocationVector)
//        makeSimpleSphere(atVector: touchLocationVector)
        makeSimpleSphere(atVector: touchLocationVector)
        print("Location: \(location), vector: \(touchLocationVector)")
    }
    
    
}

extension GameViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
       // if no node has been created yet, make one
        if scnScene.rootNode.childNodes.count < 2 {
            makeFirstSphere()
        }
    }


}
