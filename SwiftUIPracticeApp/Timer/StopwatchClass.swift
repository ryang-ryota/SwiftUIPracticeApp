//
//  StopwatchClass.swift
//  StopwatchTest
//
//  Created by Ryota on 2020/06/20.
//  Copyright © 2020 Ryota. All rights reserved.
//

import Foundation

class Stopwatch : ObservableObject {
//タイマーとして表示する値のベース　counter
    @Published var counter: Double = 0.0
    
    //基準となる時間
    var timer = Timer(
    )
    //それぞれボタンの機能
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval:0.01, repeats: true) { _ in
            self.counter += 0.01
        }
    }
    func stop() {
        timer.invalidate()
    }
    func reset() {
        timer.invalidate()
        self.counter = 0
    }
    //表示する時間を返す関数
    func now() -> String {
        let min = Int(counter / 60)
        let sec = Int(counter) % 60
        let msec = Int(counter * 100) - 100 * sec - 6000 * min
        return String(format: "%02d:%02d:%02d", arguments: [min, sec, msec])
    }
}
