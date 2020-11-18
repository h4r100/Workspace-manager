//
//  ContentView.swift
//  Shared
//
//  Created by Srihari on 18/11/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: Workspace_ManagerDocument

    var body: some View {
        HStack {
            TextEditor(text: $document.text)
            Ellipse()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(Workspace_ManagerDocument()))
    }
}
