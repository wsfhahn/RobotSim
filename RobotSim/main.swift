//
//  main.swift
//  RobotSim
//
//  Created by William Hahn on 12/1/22.
//

import Foundation

var userX: Double = 0
var userY: Double = 0

do {
    print("Stick X?")
    userX = try Double(readLine()!) ?? { throw ErrorCodes.invalidInput }()
    
    print("Stick Y?")
    userY = try Double(readLine()!) ?? { throw ErrorCodes.invalidInput }()
} catch {
    print("Error: \(error)")
    exit(0)
}

var dummyRobot = Robot.init()
var dummyStick = Controller.Joystick.init(posX: userX, posY: userY, button: false)
dummyStick.printOut()

dummyRobot.setPower(angle: dummyStick.angle, power: dummyStick.magnitude)
dummyRobot.printOut()

print("\(dummyRobot.quad1.velocityVector.0), \(dummyRobot.quad1.velocityVector.1)")
