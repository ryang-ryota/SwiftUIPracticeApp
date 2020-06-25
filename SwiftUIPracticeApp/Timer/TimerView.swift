//
//  Timer.swift
//  SwiftUIPracticeApp
//
//  Created by Ryota on 2020/06/20.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @State private var selection = 0
    var toDate = Calendar.current.date(byAdding: .second, value: 1, to: Date())!
    var body: some View{
        TabView(selection: $selection){
            CountDownView()
                .tabItem{
                    Image(systemName: "timer")
                        .imageScale(.large)
            }
            .tag(0)
            StopwatchView()
                .tabItem{
                    Image(systemName: "stopwatch")
                        .imageScale(.large)
            }.tag(1)
        }
        .navigationBarTitle(Text(verbatim: "ストップウォッチとか"), displayMode: .inline)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
