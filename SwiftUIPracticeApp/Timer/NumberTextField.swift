//
//  NumberTextField.swift
//  BindingNumberTextField
//
//  Created by yoshiyuki oshige on 2019/11/06.
//  Copyright © 2019 yoshiyuki oshige. All rights reserved.
//

import SwiftUI

struct NumberTextField: View{
    var title: String
    // 時間単位にバインディングする変数
    @Binding var number: String
    // チェックをバインディングする変数
    @Binding var isChecked: Bool
    
    var body: some View{
        HStack{
            Text(title + ":")
            TextField("0", text: $number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            // 数値チェックがtrueならチェックマークを表示する
            if numCheck(number) {
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
                    .onAppear(perform: {
                        self.isChecked = true
                    })
            } else {
                Image(systemName: "arrow.left")
                    .foregroundColor(.red)
                    .onAppear(perform: {
                        self.isChecked = false
                    })
            }
        }.frame(width: 150)
    }
    // 0<=60ならtrueを返す
    func numCheck(_ number: String) -> Bool {
        // Intに変換できるならnumに入れる
        guard let num = Int(number) else {
            return false
        }
        return num >= 0 && num <= 60
    }
}

struct NumberTextField_Previews: PreviewProvider {
    static var previews: some View {
        NumberTextField(title: "テスト", number: .constant("908"), isChecked: .constant(false))
    }
}
