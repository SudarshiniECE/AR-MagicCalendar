//
//  ViewController.swift
//  MagicCalender
//
//  Created by Sudharshini on 13/06/19.
//  Copyright © 2019 Sudharshini. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        //create a session configuration
        let configuration = ARImageTrackingConfiguration()
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "CalenderImages", bundle: Bundle.main)
        {
            configuration.trackingImages = trackedImages
            configuration.maximumNumberOfTrackedImages = 1
            
        }
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor
        {
            
            if(imageAnchor.referenceImage.name == "May")
            {
                let videoNode = SKVideoNode(fileNamed: "May.mp4")
                videoNode.play()
                let videoScene = SKScene(size: CGSize(width: 480, height: 360))
                videoNode.position = CGPoint(x: videoScene.size.width/2, y: videoScene.size.height/2)
                videoNode.yScale = -1.0
                videoScene.addChild(videoNode)
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                plane.firstMaterial?.diffuse.contents = videoScene
                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                node.addChildNode(planeNode)
            }
            if(imageAnchor.referenceImage.name == "June")
            {
                let videoNode = SKVideoNode(fileNamed: "June.mp4")
                videoNode.play()
                let videoScene = SKScene(size: CGSize(width: 480, height: 360))
                videoNode.position = CGPoint(x: videoScene.size.width/2, y: videoScene.size.height/2)
                videoNode.yScale = -1.0
                videoScene.addChild(videoNode)
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                plane.firstMaterial?.diffuse.contents = videoScene
                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                node.addChildNode(planeNode)
            }
            
        }
        return node
    }
}
