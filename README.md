# Code Together: Let's make iPhone app in an hour

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/fireworks-en/blob/master/samples/sample.gif" width="50%" height="50%"/></div>  

  Thank you for visiting our account. We are going to make a fireworks app in an hour. If would you like to study yourself before hands-on, or review what you have learned in the session, please use the following material.

## Meetup
We are providing free hands-on on a monthly basis

https://www.meetup.com/iOS-Development-Meetup-for-Beginner/

## Do you need a tutor?
We also hold face-to-face or group lesson for individual interested in making iOS app themselves

http://ios-class-for-beginner.esy.es/

## Development Environment
  Xcode 8.3.2 / Swift 3
  
  <a href="  https://github.com/learn-co-students/reading-ios-intro-to-xcode-qa-public-001">What is Xcode?</a>

# Full procedure
## 0, Create your project

> 0-1. Open Xcode  
> 0-2. Select "Create a new Xcode project"  
> 0-3. Select "Single View Application" and then tap "Next"  
> 0-4. Fill "Product name" and then tap "Next"  
> 0-5. Select the place for saving your project and then tap "Create"  

## 1, Collect Resources

> 1-1. Drop your icon into your "Assets.xcassets"
<details>
<summary>View Gif</summary>
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/fireworks-en/blob/master/samples/0.gif" /></div>
</details>
・<a href="https://www.flaticon.com/free-icon/filled-circle_60765#term=circle&page=2&position=32">Particle</a>

・<a href="https://www.flaticon.com/free-icon/firework_439597#term=firework&page=2&position=32">Fireworks</a> (Optional)

## 2, Design your app (Optional)
#### 🗂 Main.storyboard

> 2-0. Change background color to black
> <details><summary>View Gif</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/fireworks-en/blob/master/samples/2.gif" /></div></details>

> 2-1. Drap & Drop "UIImageView"
> <details><summary>View Gif</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/fireworks-en/blob/master/samples/3.gif" /></div></details>

> 2-2. Resize "UIImageView". After that, set "Autoresizing" for adjusting frame depending on devices
> <details><summary>View Gif</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/fireworks-en/blob/master/samples/4.gif" /></div></details>
> <details><summary>View Gif</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/fireworks-en/blob/master/samples/5.gif" /></div></details>
> <details><summary>View Gif</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/fireworks-en/blob/master/samples/6.gif" /></div></details>

## 3, Add code blocks in ViewController.swift
#### 🗂 ViewController.swift

Documentation 
・<a href="https://developer.apple.com/documentation/quartzcore/caemitterlayer">CAEmitterLayer</a> 
・<a href="https://developer.apple.com/documentation/quartzcore/caemittercell">CAEmitterCell</a>

```Swift  
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
```
