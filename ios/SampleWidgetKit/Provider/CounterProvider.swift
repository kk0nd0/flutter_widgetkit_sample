//
//  Provider.swift
//  Runner
//
//  Created by 近藤圭馬 on 2022/01/31.
//

import Foundation
import WidgetKit

struct CounterProvider: TimelineProvider {
    
    typealias Entry = CounterEntry
    
    // Widgetを初めて表示されたときにレンダリングする
    // https://developer.apple.com/documentation/widgetkit/timelineprovider/placeholder(in:)
    func placeholder(in context: Context) -> CounterEntry {
        CounterEntry(date: Date(), counter: 0)
    }
    
    // Widget Galleryに表示内容
    func getSnapshot(in context: Context, completion: @escaping (CounterEntry) -> ()) {
        let userDefaults = UserDefaults(suiteName: "group.sampleWidgetKit")
        let counter = userDefaults?.value(forKey: "counter_key") as? Int
        let entry = CounterEntry(date: Date(), counter: counter ?? 0)
        completion(entry)
    }

    // Widgetに表示する内容
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        // AppGroupのUserDefaultからカウンターの値を取得
        let userDefaults = UserDefaults(suiteName: "group.sampleWidgetKit")
        let counter = userDefaults?.value(forKey: "counter_key") as? Int
        var entries: [CounterEntry] = []
        entries.append(CounterEntry(date: Date(), counter: counter ?? 0))
        completion(Timeline(entries: entries, policy: .atEnd))
    }
}

struct CounterEntry: TimelineEntry {
    let date: Date
    let counter: Int
}

