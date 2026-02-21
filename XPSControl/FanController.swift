//
//  FanController.swift
//  XPSControl
//
//  Created by oNuR on 20.02.2026.
//

import Foundation

class FanController {

    private let commandFile = "/var/tmp/xps_fan_command"

    private func send(_ command: String) {
        try? command.write(toFile: commandFile,
                           atomically: true,
                           encoding: .utf8)
    }

    func auto() {
        send("auto")
    }

    func manual1800() {
        send("custom:1800")
    }
}
