//
//  TestGround.swift
//  SwiftUIPracticeApp
//
//  Created by Ryota on 2020/06/19.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI


struct TestGround: View {
    @State private var name = ""
    @State private var list = ["ABC", "123"]
    
    var body: some View {
        VStack {
            TextField("あなたの名前", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            List(0..<list.count){ item in
                Text("こんにちは、\(self.list[item])さん")
            }
        }
    }
}

struct TestGround_Previews: PreviewProvider {
    static var previews: some View {
        TestGround()
    }
}
