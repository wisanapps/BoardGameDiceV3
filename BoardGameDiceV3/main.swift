//
//  main.swift
//  BoardGameDiceV3
//
//  Created by Wisan Janchot on 25/8/2560 BE.
//  Copyright © 2560 CoalaApps. All rights reserved.
//

import Foundation

guard CommandLine.argc > 1 else {exit(0)}
guard let space = Int(CommandLine.arguments[1]) else {exit(0)}

let begin = Date()
let game = Boad()
game.possibleWay(to: space)
let end = Date()

print("Time: \(UInt(end.timeIntervalSince(begin))) s.")
