//
//  TimeProvider.swift
//  Runner
//
//  Created by 近藤圭馬 on 2022/01/31.
//

import Foundation
import WidgetKit

struct TimeProvider: TimelineProvider {
    
    typealias Entry = TimeEntry
    
    // Widgetを初めて表示されたときにレンダリングする
    // https://developer.apple.com/documentation/widgetkit/timelineprovider/placeholder(in:)
    func placeholder(in context: Context) -> TimeEntry {
        TimeEntry(date: Date())
    }

    // Widget Galleryに表示内容
    func getSnapshot(in context: Context, completion: @escaping (TimeEntry) -> ()) {
        let entry = TimeEntry(date: Date())
        completion(entry)
    }

    // Widgetに表示する内容
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [TimeEntry] = []
        let currentDate = Date()
        // 現在の時間から開始して、1時間おきに切り替わるEntryのタイムラインを生成
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = TimeEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct TimeEntry: TimelineEntry {
    let date: Date
}

