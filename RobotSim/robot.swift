//
//  Robot.swift
//  RobotSim
//
//  Created by William Hahn on 12/1/22.
//

import Foundation

struct Robot {
    struct Motor {
        enum Direction {
            case forward
            case reverse
        }
        
        enum Axis {
            case x
            case y
        }
        
        var power: Double
        var direction: Direction
        var axis: Axis
        var maxRPM: Double
        
        let wheelDiameter: Double = 96.0
        var circumference: Double { return 96.0 * .pi }
        
        var rpm: Double { return direction == .forward ? maxRPM * -power : maxRPM * power }
        var velocity: Double { return (rpm / 60) * circumference }
        
        var velocityVector: (Double, Double) {
            let wheelAngle: Double = axis == .x ? .pi / 4 : (7 * .pi) / 4
            
            let velX: Double = velocity * sin(wheelAngle)
            let velY: Double = velocity * cos(wheelAngle)
            
            return (velX, velY)
        }
        
        init(power: Double, direction: Direction, axis: Axis, maxRPM: Double) {
            self.power = power
            self.direction = direction
            self.axis = axis
            self.maxRPM = maxRPM
        }
    }
    
    var quad1 = Motor.init(power: 0, direction: .forward, axis: .x, maxRPM: 312)
    var quad2 = Motor.init(power: 0, direction: .forward, axis: .y, maxRPM: 312)
    var quad3 = Motor.init(power: 0, direction: .reverse, axis: .x, maxRPM: 312)
    var quad4 = Motor.init(power: 0, direction: .reverse, axis: .y, maxRPM: 312)
    
    mutating func setPower(angle: Double, power: Double) {
        let correctedAngle = angle + (.pi / 4)
        
        quad1.power = quad1.axis == .x ? power * cos(correctedAngle) : power * sin(correctedAngle)
        quad1.power = quad1.direction == .forward ? -1 * quad1.power : quad1.power
        
        quad2.power = quad2.axis == .x ? power * cos(correctedAngle) : power * sin(correctedAngle)
        quad2.power = quad2.direction == .forward ? -1 * quad2.power : quad2.power
        
        quad3.power = quad3.axis == .x ? power * cos(correctedAngle) : power * sin(correctedAngle)
        quad3.power = quad3.direction == .forward ? -1 * quad3.power : quad3.power
        
        quad4.power = quad4.axis == .x ? power * cos(correctedAngle) : power * sin(correctedAngle)
        quad4.power = quad4.direction == .forward ? -1 * quad4.power: quad4.power
    }
    
    func printOut() {
        print("Quadrant 1: \(quad1.power)")
        print("Quadrant 2: \(quad2.power)")
        print("Quadrant 3: \(quad3.power)")
        print("Quadrant 4: \(quad4.power)\n")
    }
}
