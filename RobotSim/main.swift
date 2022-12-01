//
//  main.swift
//  RobotSim
//
//  Created by William Hahn on 12/1/22.
//

import Foundation

var dummyRobot = Robot.init()
var dummyStick = Controller.Joystick.init(posX: 0, posY: 1, button: false)

dummyStick.printOut()
dummyRobot.setPower(angle: dummyStick.angle, power: dummyStick.magnitude)
dummyRobot.printOut()
