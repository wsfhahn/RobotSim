//
//  main.swift
//  RobotSim
//
//  Created by William Hahn on 12/1/22.
//

import Foundation

var dummyRobot = Robot.init()
var dummyStick = Controller.Joystick.init(posX: 1, posY: 0, button: false)

for _ in 0...1000 {
    dummyStick.scramble()
    dummyStick.printOut()
    
    dummyRobot.setPower(angle: dummyStick.angle, power: dummyStick.magnitude)
    dummyRobot.printOut()
}
