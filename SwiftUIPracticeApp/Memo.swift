//
//  Memo.swift
//  SwiftUIPracticeApp
//
//  Created by Ryota on 2020/06/18.
//  Copyright © 2020 Ryota. All rights reserved.
//

import SwiftUI


struct Memo: View {
    
    @State private var memos:[String] = ["Hi"]
    @Binding var newMemo: String
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 15)
            HStack {
                TextField("なんかおもろいこと書いてや", text: $newMemo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.default)
                    .padding()
                
                Button(action: {
                    if self.newMemo.count % 3 == 0 {
                        self.showAlert = true
                        self.newMemo = ""
                    }else{
                        self.memos.append(self.newMemo)
                        self.newMemo = ""
                    }
                }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .frame(width: 50, height: 30, alignment: .center)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("そんなに面白くありません"), dismissButton: .default(Text("考え直す")))}
            }
            
            Divider()
            List (0 ..< memos.count){ item in
                HStack{
                    Text(String(item))
                    Text(self.memos[item])
                }
            }
            .navigationBarTitle(Text(verbatim: "メモ的ななにか"), displayMode: .inline)
        }
    }
    
}



struct Memo_Previews: PreviewProvider {
    static var previews: some View {
        Memo(newMemo: .constant("test"))
    }
}
