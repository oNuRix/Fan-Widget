//
//  FanModeIntent.swift
//  XPSControl
//
//  Created by oNuR on 21.02.2026.
//

import AppIntents

enum FanMode: String, AppEnum {
    case auto
    case manual

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Fan Mode"

    static var caseDisplayRepresentations: [FanMode: DisplayRepresentation] = [
        .auto: "Auto",
        .manual: "Manual"
    ]
}

struct FanModeIntent: AppIntent {

    static var title: LocalizedStringResource = "Change Fan Mode"

    @Parameter(title: "Mode")
    var mode: FanMode

    func perform() async throws -> some IntentResult {

        let command = mode == .auto ? "auto" : "manual"
        let path = "/var/tmp/xps_fan_command"

        do {
            try command.write(toFile: path, atomically: true, encoding: .utf8)
            print("🔥 FILE WRITTEN:", command)
        } catch {
            print("❌ WRITE ERROR:", error.localizedDescription)
        }

        return .result()
    }
}
