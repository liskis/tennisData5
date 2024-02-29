//
//  Complication.swift
//  Complication
//
//  Created by 渡辺健輔 on 2024/02/28.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct ComplicationEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    @State var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .accessoryCorner:
            CornerComplication(entry: $entry)
        case .accessoryCircular:
            CircularComplication()
        case .accessoryInline:
            InlineComplication(entry: $entry)
        case .accessoryRectangular:
            RectangularComplication()
        @unknown default:
            Text("No　Complication")
        }
            
//        VStack {
//            HStack {
//                Text("Time:")
//                Text(entry.date, style: .time)
//            }
//
//            Text("Emoji:")
//            Text(entry.emoji)
//        }
    }
}

struct InlineComplication : View {
    @Binding var entry: SimpleEntry
    var body: some View {
        Text("Tennis Data")
    }
}

struct CircularComplication : View {
    var body: some View {
        Image(.compIcon)
    }
}

struct CornerComplication : View {
    @Binding var entry: SimpleEntry
    var body: some View {
        Image(.compIcon)
            .resizable()
            .widgetLabel {
                Text("TennisData")
            }
    }
}

struct RectangularComplication : View {
    var body: some View {
        Text("RectangularComp")
            .font(.system(size: 12.0))
    }
}

@main
struct Complication: Widget {
    let kind: String = "Complication"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(watchOS 10.0, *) {
                ComplicationEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ComplicationEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("テニスデータ")
        .description("テニスデータへのショートカット")
    }
}

#Preview(as: .accessoryCircular) {
    Complication()
} timeline: {
    SimpleEntry(date: .now)
}
