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
var scnScene: SphereScene!
var cameraNode: SCNNode!

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
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
        scnScene = SphereScene.init()
        scnView.scene = scnScene
    }
    
    func setupCamera() {
        let myScreenSize: CGRect = UIScreen.main.bounds
        let myScreenHeight = myScreenSize.height
        let cameraPosition = Float(myScreenHeight) * 0.01
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        //cameraNode.position = SCNVector3(x: 0, y: cameraPosition, z: 15)
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func makeFirstSphere() {
        let geometry = SCNSphere(radius: 1.0)
        geometry.materials.first?.diffuse.contents = UIColor.red
        let sphereNode = SCNNode(geometry: geometry)
        let position = SCNVector3(x: 0, y: 0, z: 0)
        sphereNode.position = position
        scnScene.rootNode.addChildNode(sphereNode)
    }

}

extension GameViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        makeFirstSphere()
    }
}
