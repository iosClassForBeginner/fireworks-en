//
//  ViewController.swift
//  fireworks-en
//
//  Created by Wataru Maeda on 2017/07/27.
//  Copyright © 2017 Wataru Maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let emitterLayer = CAEmitterLayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupBaseLayer()
        launchFireworks()
    }
    
    func setupBaseLayer()
    {
        // Add a layer that emits, animates, and renders a particle system.
        let size = view.bounds.size
        emitterLayer.emitterPosition = CGPoint(x: size.width / 2, y: size.height - 100)
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        view.layer.addSublayer(emitterLayer)
    }
    
    func launchFireworks()
    {
        // Get particle image
        let particleImage = UIImage(named: "particle")?.cgImage
        
        // The definition of a particle (launch point of the firework)
        let baseCell = CAEmitterCell()
        baseCell.color = UIColor.white.withAlphaComponent(0.8).cgColor
        baseCell.emissionLongitude = -CGFloat.pi / 2
        baseCell.emissionRange = CGFloat.pi / 5
        baseCell.emissionLatitude = 0
        baseCell.lifetime = 2.0
        baseCell.birthRate = 1
        baseCell.velocity = 400
        baseCell.velocityRange = 50
        baseCell.yAcceleration = 300
        baseCell.redRange   = 0.5
        baseCell.greenRange = 0.5
        baseCell.blueRange  = 0.5
        baseCell.alphaRange = 0.5
        
        // The definition of a particle (rising animation)
        let risingCell = CAEmitterCell()
        risingCell.contents = particleImage
        risingCell.emissionLongitude = (4 * CGFloat.pi) / 2
        risingCell.emissionRange = CGFloat.pi / 7
        risingCell.scale = 0.4
        risingCell.velocity = 100
        risingCell.birthRate = 50
        risingCell.lifetime = 1.5
        risingCell.yAcceleration = 350
        risingCell.alphaSpeed = -0.7
        risingCell.scaleSpeed = -0.1
        risingCell.scaleRange = 0.1
        risingCell.beginTime = 0.01
        risingCell.duration = 0.7
        
        // The definition of a particle (spark animation)
        let sparkCell = CAEmitterCell()
        sparkCell.contents = particleImage
        sparkCell.emissionRange = 2 * CGFloat.pi
        sparkCell.birthRate = 8000
        sparkCell.scale = 0.5
        sparkCell.velocity = 130
        sparkCell.lifetime = 3.0
        sparkCell.yAcceleration = 80
        sparkCell.beginTime = 1.5
        sparkCell.duration = 0.1
        sparkCell.alphaSpeed = -0.1
        sparkCell.scaleSpeed = -0.1
        
        // baseCell contains rising and spark particle with animation
        baseCell.emitterCells = [risingCell, sparkCell]
        
        // Add baseCell to the emitter layer
        emitterLayer.emitterCells = [baseCell]
    }
}

