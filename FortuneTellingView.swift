//
//  FortuneTellingView.swift
//  SwiftUIPracticeApp
//
//  Created by Ryota on 2020/06/23.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI

struct FortuneTellingView: View {
    
    //スライダー表記数値
    @State var volume: Double = 0
    
    // スライダー表記数値の小数点以下を２桁にする
    func format(_ num:Double) -> String {
        let result = String(round(num*100)/100)
        return result
    }
    
    //色ピッカー用カラーリスト
    @State private var selectedColor = 0
    let colors = [Color.pink, Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    let colorNames = ["Pink", "Red", "Orange", "Yellow", "Green", "Blue", "Pueple"]
    
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    VStack{
                        Image(systemName: "arrow.down")
                            .font(.system(size: 32))
                            .frame(height: 150)
                        Text("SCROLL ME!!").font(.footnote)
                        Image(systemName: "arrow.down")
                            .font(.system(size: 32))
                            .frame(height: 150)
                    }
                    //LikeOrNotトグル
                    HStack {
                        Text("Like! or Not?").font(.title)
                        Text("(Tap, if not)")
                    }
                    .padding(.top, 100.0)
                    ToggleStruct(isOK: true, like: "sun.max.fill", not: "cloud")
                    ToggleStruct(isOK: true, like: "person.3.fill", not: "person")
                    ToggleStruct(isOK: true, like: "yensign.circle.fill", not: "yensign.circle")
                    
                    //左右の好きさ加減解答用スライダー
                    Text("\(format(volume))").padding(.top, 150.0)
                    (volume < 0.5) ? Text("左の方が好きかな...")
                        .fontWeight(.light) : Text ("いややっぱ右っしょ")
                            .fontWeight(.heavy)
                    HStack {
                        Image(systemName: "hand.point.left").imageScale(.large).padding()
                        Slider(value: $volume)
                        Image(systemName: "hand.point.right").imageScale(.large).padding()
                    }.padding()
                    
                    //色ピッカー
                    Picker(selection: $selectedColor, label: Text("")) {
                        ForEach (0 ..< colors.count){ index in
                            Text(self.colorNames[index])
                        }
                    }.labelsHidden().padding(.top, 100)
                    HStack{
                        colors[selectedColor]
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .frame(width: 75, height: 75)
                        Text("\(colorNames[selectedColor])").font(.system(.title, design: .monospaced)).padding()
                    }.padding(.bottom, 150)
                }
            }
            //占い結果表示リンク（固定）
            GeometryReader{ geometry in
                Capsule()
                    .frame(width: 250, height: 50, alignment: .center)
                    .foregroundColor(Color.yellow.opacity(0.2))
                    .shadow(color: .orange, radius: 3, x: 10, y: 10)
                    .overlay(
                        NavigationLink(destination: MapViewTest().navigationBarTitle(Text("ラッキープレイス"))){
                            VStack(alignment: .trailing){
                                Text("占い結果を見る")
                                    .font(.title)
                                Text("ラッキープレイスを表示します")
                                    .font(.caption)
                            }
                    })
                    .accentColor(.black)
                    .position(x: CGFloat(Int(geometry.frame(in: .local).midX)), y: CGFloat(Int(geometry.frame(in: .local).maxY) - 50))
            }
        }.navigationBarTitle("今の気持ちを教えてください")
    }
}



//LikeOrNotのトグルの構造体
struct ToggleStruct: View {
    @State var isOK: Bool
    var like : String
    var not : String
    
    var body: some View{
        HStack {
            Button(action: {
                withAnimation {
                    self.isOK.toggle()
                }
            }) {
                Image(systemName: isOK ? "\(like)" : "\(not)")
                    .foregroundColor(isOK ? .blue : .black)
                    .rotationEffect(.degrees(isOK ? 0 : 180))
                    .scaleEffect(3)
            }
            .padding(30)
            Text(isOK ? "Like" : "Not")
                .font(.title)
                .foregroundColor(isOK ? .pink : .gray)
                .rotationEffect(.degrees(isOK ? 0 : 180))
        }
    }
}


struct FortuneTellingView_Previews: PreviewProvider {
    static var previews: some View {
        FortuneTellingView()
    }
}
