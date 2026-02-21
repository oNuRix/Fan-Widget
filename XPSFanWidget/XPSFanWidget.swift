//
//  XPSFanWidget.swift
//  XPSFanWidget
//
//  Created by oNuR on 21.02.2026.
//

import WidgetKit
import SwiftUI
import AppIntents

// MARK: - ENTRY

struct SimpleEntry: TimelineEntry {
    let date: Date
}

// MARK: - PROVIDER

struct Provider: TimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(SimpleEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let entry = SimpleEntry(date: Date())
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

// MARK: - VIEW

struct XPSFanWidgetEntryView: View {

    var entry: SimpleEntry

    var body: some View {

        VStack(spacing: 18) {

            Text("Fan Control")
                .font(.headline)

            HStack(spacing: 14) {

                Button(intent: {
                    var i = FanModeIntent()
                    i.mode = .auto
                    return i
                }()) {
                    Text("AUTO")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)

                Button(intent: {
                    var i = FanModeIntent()
                    i.mode = .manual
                    return i
                }()) {
                    Text("MANUAL")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .containerBackground(.ultraThinMaterial, for: .widget)
    }
}

// MARK: - WIDGET

struct XPSFanWidget: Widget {

    let kind: String = "XPSFanWidget"

    var body: some WidgetConfiguration {

        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            XPSFanWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("XPS Fan")
        .description("Control fan mode")
        .supportedFamilies([.systemSmall])
    }
}
