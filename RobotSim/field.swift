//
//  field.swift
//  RobotSim
//
//  Created by William Hahn on 12/2/22.
//

import Foundation

struct Field {
    struct Pole {
        enum Height {
            case short
            case medium
            case tall
        }
        
        var x: Int
        var y: Int
        
        var scored: Bool
        var height: Height
        
        init(x: Int, y: Int, scored: Bool, height: Height) {
            self.x = x
            self.y = y
            self.scored = scored
            self.height = height
        }
    }
    
    struct GroundJunction {
        var x: Int
        var y: Int
        
        var scored: Bool
        
        init(x: Int, y: Int, scored: Bool) {
            self.x = x
            self.y = y
            self.scored = scored
        }
    }
    
    struct Cone {
        var x: Double
        var y: Double
        
        var pickedUp: Bool
        
        init(x: Double, y: Double, pickedUp: Bool) {
            self.x = x
            self.y = y
            self.pickedUp = pickedUp
        }
    }
}
