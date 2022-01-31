//
//  SmallWidget.swift
//  Runner
//
//  Created by 近藤圭馬 on 2022/01/31.
//

import Foundation
import WidgetKit
import SwiftUI

///表示されるWidgetVIew
struct CounterWidgetKitEntryView : View {
    // Widget Sizeの取得
    @Environment(\.widgetFamily) var family
    
    var entry: CounterProvider.Entry
    var body: some View {
        switch family {
        case .systemSmall:
            Text("Small")
            Text(entry.counter.description)
        case .systemMedium:
            Text("Medium")
            Text(entry.counter.description)
        default:
            Text("Some other WidgetFamily in the future.")
        }
    }
}

struct CounterWidget: Widget {
    
    // Flutterで参照する文字列
    let kind: String = "CounterWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CounterProvider()) { entry in
            CounterWidgetKitEntryView(entry: entry)
        }
        .configurationDisplayName("My Sample Widget")
        .description("This is an example widget.")
        // WidgetのサイズをSmallとMediumに固定
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct SmallWidget_Previews: PreviewProvider {
    static var previews: some View {
        CounterWidgetKitEntryView(entry: CounterEntry(date: Date(), counter: 0))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

