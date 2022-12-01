//
//  errorCatching.swift
//  RobotSim
//
//  Created by William Hahn on 12/1/22.
//

import Foundation

enum ErrorCodes: Error {
    case invalidInput
    case invalidMagnitude
    case negativeAngle
}
