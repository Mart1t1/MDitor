//
//  Editor.swift
//  MDitor
//
//  Created by Martin Lacaille on 23/11/2020.
//

import Foundation
import SwiftUI

struct Editor: View {
    @Binding var inputText: String
    @State private var wordCount: Int = 0
    @Binding var Lines: [String.SubSequence]
    
 
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextEditor(text: $inputText)
                .font(.body)
                .padding()
                .padding(.top, 20)
                .onChange(of: inputText) { value in
                    let words = inputText.split { $0 == " " || $0.isNewline }
                    Lines =
                        inputText.split {$0.isNewline}
                    self.wordCount = words.count
                }
 
            Text("\(wordCount) words")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.trailing)
        }
    }
}

struct Editor_Previews: PreviewProvider {
    static var previews: some View {
        //Editor()
        Text("d jhjhgjkbjhgkjhgkjhg kjhgkjhgkjhgkjhg jhgkjgkjg")
            
    }
}
