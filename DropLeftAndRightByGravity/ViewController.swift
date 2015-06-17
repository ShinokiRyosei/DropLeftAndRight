//
//  ViewController.swift
//  DropLeftAndRightByGravity
//
//  Created by Life is Tech on 17/6/15.
//  Copyright (c) 2015 shinokiryosei. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    //    @IBOutlet weak var ball: UIView!
    
    @IBOutlet var balls: [UIView]!
    
    //    DynamicAnimatorを変数宣言する
    var dynamicAnimator: UIDynamicAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.startGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGame() {
        //        UIDynamicAnimatorのクラス群のUIDynamicBehaviorを使う
        //        let gravityBehavior = UIGravityBehavior(items: [self.ball])
        let gravityBehavior = UIGravityBehavior(items: self.balls)
        
        gravityBehavior.gravityDirection.dx = 1.0
        gravityBehavior.gravityDirection.dy = 1.0
        
        gravityBehavior.magnitude = 1.0
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicAnimator.addBehavior(gravityBehavior)
        
        //        衝突のシュミレーションのためにUICollisionBehaviorを使う
        //        let collisionBehavior = UICollisionBehavior(items: [self.balls])
        let collisionBehavior = UICollisionBehavior(items: self.balls)
        
        //        外枠にボールがぶつかれば跳ね返るようにする
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        dynamicAnimator.addBehavior(collisionBehavior)
        
        
        
        
    }
    
    
}

