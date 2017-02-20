//
//  DragImage.swift
//  littleMonster
//
//  Created by saurabh deopura on 2/20/17.
//  Copyright © 2017 Deopura. All rights reserved.
//

import Foundation
import UIKit

class DragImage:UIImageView
{
    var  originalPosition: CGPoint!
    
    override init(frame:CGRect){
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        originalPosition = self.center
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let position = touch.location(in: self.superview)
            self.center = CGPoint(x: position.x, y: position.y)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.center = originalPosition
    }
}
    
    

