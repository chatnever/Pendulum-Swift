//
//  ViewController.swift
//  PendulumInSwift
//
//  Created by Dzung Nguyen on 10/3/14.
//  Copyright (c) 2014 Dzung Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pendulum: UIImageView?
    @IBOutlet weak var sliderAngle: UISlider?
    
    var _time: NSTimer?
    var _angle, _angleDelta : Double!
    let MAX_ANGLE = M_PI_4 / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var size: CGSize = self.pendulum!.bounds.size
        self.pendulum?.layer.anchorPoint = CGPointMake(0.5, 0)
        self.pendulum?.frame = CGRectMake((self.view.bounds.size.width - size.width) / 2, 20, size.width, size.height)
        
        _angle = 0.0
        _angleDelta = 0.05
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func startAnimation(sender: UISwitch) {
        if sender.on {
            _time = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animatePendulum:", userInfo: nil, repeats: true)
            _time?.fire()
        } else {
            _time?.invalidate()
        }
    }
    
    func animatePendulum(sender: NSTimer) {
        _angle = _angle + _angleDelta
        if ((_angle > MAX_ANGLE) | (_angle < -MAX_ANGLE)) {
            _angleDelta = -_angleDelta
        }
        self.pendulum?.transform = CGAffineTransformMakeRotation(CGFloat(_angle))
        NSLog("%3.2f - %3.2f", self.pendulum!.center.x, self.pendulum!.center.y)
        pendulum?.isAnimating()
    }
    
    @IBAction func changeAngle(sender: UISlider) {
        self.pendulum?.transform = CGAffineTransformMakeRotation(CGFloat(MAX_ANGLE) * CGFloat(sender.value))
        self.sliderAngle?.addSubview(pendulum!)
        println("\(pendulum!)")
    }
    

}

