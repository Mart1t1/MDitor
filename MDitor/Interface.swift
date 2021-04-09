//
//  Interface.swift
//  MDitor
//
//  Created by Martin Lacaille on 24/11/2020.
//

import SwiftUI

struct Interface: View {
    @State private var isEditor = true
    @State private var LinesArr : [Substring] = []
    @State private var InputText = ""
    //@State private var Lines : Array<Substring>
    var body: some View
    {
        
        //Lines = Editor().Lines
    NavigationView
    {
        VStack
        {
                if isEditor
                {
                    Editor(inputText: $InputText, Lines: $LinesArr)
                }
                else
                    {
                        ScrollView()
                        {
                        ContentView(txtToDisplay: greatView(content: LinesArr))
                        }.padding(.top, 30.0)
                    }
                //Lines = Editor().Lines
            
            Spacer()
            //Toggle("Editor", isOn: $isEditor).position(CGPoint(x: -120, y: 10.0))
        }.toolbar
        {
            ToolbarItem(placement: .bottomBar) {
                                // 3.
                                HStack(spacing: 50) {
                                    Image(systemName: "trash").onTapGesture{InputText = ""}
                                    Image(systemName: "folder")
                                    Image(systemName: "square.and.arrow.up").onTapGesture {
                                        onShareTap(InputText: InputText)
                                    }
                                    if(isEditor)
                                    {
                                        Image(systemName: "doc.plaintext").onTapGesture {
                                            isEditor = false
                                        }
                                    }
                                    else
                                    {
                                        Image(systemName: "pencil.tip.crop.circle").onTapGesture{isEditor = true}
                                    }
                                    // 4.
                                }
            
            
        }
        }
    }
    }
}

struct Interface_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Interface()
            Interface()
        }
    }
}
