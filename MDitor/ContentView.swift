//
//  ContentView.swift
//  MDitor
//
//  Created by Martin Lacaille on 23/11/2020.
//

import SwiftUI

struct ContentView: View {
    var txtToDisplay: Text
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                txtToDisplay
                Spacer()
            }
            
        }.padding(3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView(txtToDisplay: Text("hello there"))
        ContentView(txtToDisplay: (greatView(content: ["**sdfsfsdf** _wfwe_ __sfdsf__", "# Oui"])))
    }
}
