//
//  MediumWidget.swift
//  Runner
//
//  Created by 近藤圭馬 on 2022/01/31.
//

import Foundation
import WidgetKit
import SwiftUI

///表示されるWidgetVIew
struct TimeWidgetKitEntryView : View {
    var entry: TimeProvider.Entry
    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct TimeWidget: Widget {
    
    // Flutterで参照する文字列
    let kind: String = "TimeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TimeProvider()) { entry in
            TimeWidgetKitEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TimeWidget_Previews: PreviewProvider {
    static var previews: some View {
        TimeWidgetKitEntryView(entry: TimeEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

