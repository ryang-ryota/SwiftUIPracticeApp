//
//  ContentView.swift
//  StopwatchTest
//
//  Created by Ryota on 2020/06/20.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI

struct StopwatchView: View {
    @ObservedObject var stopwatch = Stopwatch()
    
    @State var startBool = false
    @State var stopBool = true
    @State var resetBool = true
    
    //ボタンのアクティブ、非アクティブを操作
    func onOff(_ start: Bool, _ stop: Bool, _ reset: Bool) {
        self.startBool = start
        self.stopBool = stop
        self.resetBool = reset
    }
    
    var body: some View {
        VStack{
            Image(systemName: "stopwatch")
                .imageScale(.large)
            Text(stopwatch.now())
                .font(.system(size: 64, design: .monospaced))
            HStack {
                
                //スタートボタン
                Button(action: {
                    self.stopwatch.start()
                    self.onOff(true, false, false)
                }) {
                    Image(systemName: "play.fill")
                        .padding()
                        .imageScale(.large)
                }
                .disabled(startBool)
                
                //ポーズボタン
                Button(action: {
                    self.stopwatch.stop()
                    self.onOff(false, true, false)
                }) {
                    Image(systemName: "pause.fill")
                        .padding()
                        .imageScale(.large)
                }
                .disabled(stopBool)
                
                //リセットボタン
                Button(action: {
                    self.stopwatch.reset()
                    self.onOff(false, true, true)
                }) {
                    Image(systemName: "stop.fill")
                        .padding()
                        .imageScale(.large)
                }
                .disabled(resetBool)
            }
        }
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
