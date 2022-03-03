//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Hubert Le on 2/23/22.
//

//4. import podfiles
import TheAnimation
import UIKit

class ViewController: UIViewController {
    
    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Create CG layer && made Square
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { //call function after 3 seconds
            self.rotate()
            self.animateOpacity()
            self.animateMovement()
        }
    }
    
    //2. add animated square
    func animateMovement() {
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2), y: layer.frame.origin.y + (layer.frame.size.height/2))
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.timingFunction = .easeInEaseOut
        animation.duration = 1
        animation.fillMode = .forwards //forwards = does not go back to starting location
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        animation.animate(in: layer)
    }
    
    //3. add animated opacity
    func animateOpacity() {
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        animation.fillMode = .forwards //forwards = does not go back to starting location
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        animation.animate(in: layer)
    }
    
    //5. add animated square
    func rotate() {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi * 12
        animation.timingFunction = .easeInEaseOut
        animation.duration = 1
        animation.fillMode = .forwards //forwards = does not go back to starting location
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        animation.animate(in: layer)
    }
    

}

