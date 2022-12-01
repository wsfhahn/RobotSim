//
//  main.swift
//  RobotSim
//
//  Created by William Hahn on 11/29/22.
//

import Foundation

/*
 TODO: Make sure that all possible stick values are within unit circle |O|
 TODO: Add stick angle as a computed property |√|
*/

struct Controller {
    struct Joystick {
        func computeAngle(_ x: Double, _ y: Double) -> Double {
            var angle: Double = 0
            
            if (x > 0) {
                if (y > 0) {
                    angle = atan(y / x)
                } else {
                    angle = (2 * .pi) + atan(y / x)
                }
            } else if (x < 0) {
                angle = atan(y / x) + .pi
            } else {
                if (y > 0) {
                    angle = .pi / 2
                } else if (y < 0) {
                    angle = (3 * .pi) / 2
                } else {
                    angle = 0
                }
            }
            
            return angle
        }
        
        var posX: Double
        var posY: Double
        var button: Bool
        
        var angle: Double { return computeAngle(posX, posY) }
        
        var magnitude: Double { return sqrt((posX * posX) + (posY * posY)) }
        
        init(posX: Double, posY: Double, button: Bool) {
            self.posX = posX
            self.posY = posY
            self.button = button
        }
        
        mutating func scramble() {
            posX = .random(in: -1...1)
            posY = .random(in: -1...1)
        }
        
        func printOut() {
            if (angle >= 0) {
                print("Stick: X: \(posX.truncate(2)), Y: \(posY.truncate(2))")
                print("Angle: \(angle.toDegrees.truncate(2))")
                print("Magnitude: \(magnitude.truncate(2))\n")
            } else {
                print("Error! Negative angle!")
                exit(0)
            }
        }
    }
    
    var leftStick: Joystick
    var rightStick: Joystick
    
    var leftTrigger: Double
    var rightTrigger: Double
    
    init(leftStick: Joystick, rightStick: Joystick, leftTrigger: Double, rightTrigger: Double) {
        self.leftStick = leftStick
        self.rightStick = rightStick
        self.leftTrigger = leftTrigger
        self.rightTrigger = rightTrigger
    }
}

extension Double {
    func truncate(_ places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
    
    var toDegrees: Double {
        return (self * 180) / .pi
    }
}
