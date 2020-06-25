//
//  ContentView.swift
//  SwiftUIPracticeApp
//
//  Created by Ryota on 2020/06/16.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: Memo(newMemo: .constant("123"))) {
                    Text("メモ")
                }
                NavigationLink(destination: TimerView()) {
                    Text("タイマーとストップウォッチ")
                }
                NavigationLink(destination: FortuneTellingView()) {
                    Text("占い")
                }
            }
            .navigationBarTitle("ぷろぐらみんぐはじめました", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
