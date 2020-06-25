//
//  CountDownView.swift
//  SwiftUIPracticeApp
//
//  Created by Ryota on 2020/06/23.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI

struct CountDownView: View {
        @State private var count = 0
        @State private var showAlart = false
        //時間単位
        @State var hour:String = ""
        @State var min:String = ""
        @State var sec:String = ""
        @State var intHour:Int?
        @State var intMin:Int?
        @State var intSec:Int?
        
        //各フィールドチェック
        @State var isCheckedHour:Bool = false
        @State var isCheckedMin:Bool = false
        @State var isCheckedSec:Bool = false
        
        var body: some View {
            VStack {
                VStack {
                    Image(systemName: "timer").imageScale(.large).padding()
                    NumberTextField(title: "hour", number: $hour, isChecked: $isCheckedHour)
                    NumberTextField(title: "min", number: $min, isChecked:  $isCheckedMin)
                    NumberTextField(title: "sec", number: $sec, isChecked: $isCheckedSec)
                }
                if isCheckedHour && isCheckedMin && isCheckedSec {
                    HStack{
                        Button(action: {self.startCountDown()}) {
                            Image(systemName: "play")
                        }.padding().imageScale(.large)
                        Button(action: {}) {
                            Image(systemName: "gobackward")
                        }.padding().imageScale(.large).disabled(true)
                    }
                } else { Text("Enter numbers (0<60)").foregroundColor(.gray).padding() }
                Text(String(format: "%02dh:%02dm:%02ds", arguments: [
                    intHour ?? 00,
                    intMin ?? 00,
                    intSec ?? 00])
                ).font(.system(size: 48)).alert(isPresented: self.$showAlart){
                    Alert(title: Text("すみませんね"), message: Text("まだタイマーの停止ボタンつくってないんです"), primaryButton: .default(Text("うん、ええよ"), action:{self.showAlart = false}), secondaryButton: .cancel(Text("はよして"), action:{self.showAlart = false}))
                }
            }
        }
        //フィールドに入力された数値を変換して表示＆タイマースタート
        func startCountDown () -> Void {
            if let countHour = Int(hour) {
                self.intHour = countHour
                count += Int(hour)! * 3600
            }
            if let countMin = Int(min) {
                self.intMin = countMin
                count += Int(min)! * 60
            }
            if let countSec = Int(sec) {
                self.intSec = countSec
                count += Int(sec)!
            }
            _ = Timer.scheduledTimer(withTimeInterval: 1, // 起動までの時間（リピートの間隔）
                repeats: true,                        // リピートするかどうか
                block: { timer in                     // タイマー動作中の処理
                    if self.count % 3600 == 0 {
                        if self.count == 0 {
                            self.showAlart = true
                            timer.invalidate()
                            self.count -= 1
                        } else {
                            self.intHour! -= 1
                            self.intMin = 59
                            self.intSec = 59
                            self.count -= 1
                        }
                    } else if self.count % 60 == 0 {
                        self.intMin! -= 1
                        self.intSec = 59
                        self.count -= 1
                    } else if self.count > 0 {
                        self.intSec! -= 1
                        self.count -= 1
                    }
            })
        }
    }


struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView()
    }
}
