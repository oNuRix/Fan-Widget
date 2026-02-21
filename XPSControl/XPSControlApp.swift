//
//  XPSControlApp.swift
//  XPSControl
//
//  Created by oNuR on 20.02.2026.
//

import SwiftUI
import AppIntents

@main
struct XPSControlApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

