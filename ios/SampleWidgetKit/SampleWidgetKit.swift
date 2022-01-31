//
//  SampleWidgetKit.swift
//  SampleWidgetKit
//
//  Created by 近藤圭馬 on 2022/01/31.
//

import WidgetKit
import SwiftUI

@main
struct SampleWidgetKit: WidgetBundle {
    
    var body: some Widget {
        // Only SmallWidget MediumWidget
        CounterWidget()
        // All Widget Size
        TimeWidget()
    }
}
