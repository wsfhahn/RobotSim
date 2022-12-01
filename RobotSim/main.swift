//
//  main.swift
//  RobotSim
//
//  Created by William Hahn on 12/1/22.
//

import Foundation

print("Stick X?")
let userX = Double(readLine()!) ?? 0

print("Stick Y?")
let userY = Double(readLine()!) ?? 0

var dummyRobot = Robot.init()
var dummyStick = Controller.Joystick.init(posX: userX, posY: userY, button: false)
dummyStick.printOut()

dummyRobot.setPower(angle: dummyStick.angle, power: dummyStick.magnitude)
dummyRobot.printOut()
