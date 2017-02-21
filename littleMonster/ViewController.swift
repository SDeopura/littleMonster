//
//  ViewController.swift
//  littleMonster
//
//  Created by saurabh deopura on 2/19/17.
//  Copyright © 2017 Deopura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var heartImg: DragImage!
    @IBOutlet weak var foodImg: DragImage!
    
    @IBOutlet var penalty1Img: UIImageView!
    @IBOutlet var penalty2Img: UIImageView!
    @IBOutlet var penalty3Img: UIImageView!
    
    
    let DIM_AlPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        penalty1Img.alpha = DIM_AlPHA
        penalty2Img.alpha = DIM_AlPHA
        penalty3Img.alpha = DIM_AlPHA
        
        
       NotificationCenter.default.addObserver(self, selector: Selector(("itemDroppedOnCharacter:")), name: NSNotification.Name(rawValue: "onTargetDropped"), object: nil)
        
        startTimer()
    

}
    func itemDroppedOnCharacter(notif: AnyObject)
    {
        
    }
    func startTimer()
    {
        if timer
            != nil
        {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func changeGameState()
    {
        penalties += 1
        
        if penalties == 1{
            penalty1Img.alpha = OPAQUE
            penalty2Img.alpha = DIM_AlPHA
            
        }else if penalties == 2
        {
            penalty2Img.alpha = OPAQUE
            penalty3Img.alpha = DIM_AlPHA
        }
        else if penalties >= 3
        {
            penalty3Img.alpha = OPAQUE
        }
        else{
            penalty1Img.alpha = DIM_AlPHA
            penalty2Img.alpha = DIM_AlPHA
            penalty3Img.alpha = DIM_AlPHA
        }
        
        if penalties >= MAX_PENALTIES
        {
            gameOver()
        }
    }
    
    func gameOver()
    {
        timer.invalidate()
        monsterImg.playDeathAnimation()
    }


}
