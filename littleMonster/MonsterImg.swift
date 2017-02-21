//
//  MonsterImg.swift
//  littleMonster
//
//  Created by saurabh deopura on 2/20/17.
//  Copyright © 2017 Deopura. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView
{
    override init (frame: CGRect){
         super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
   
    func playIdleAnimation()
    {
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for i in 1...4
        {
            let img = UIImage(named: "idle\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation()
    {
        self.image = UIImage(named: "dead5.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for i in 1...5
        {
            let img = UIImage(named: "dead\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }

    }
