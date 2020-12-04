//
//  OpenView.swift
//  Workspace-Manager
//
//  Created by Srihari on 25/11/20.
//

import SwiftUI
import Foundation


let document = Workspace_ManagerDocument()
let files = FileManager()

func openApps() {
    let lines = document.text.components(separatedBy: .newlines)
    for line in lines {
        
        
        
        guard let cmdIndex = line.firstIndex(of: " ") else { return }
        let urlString = line[(cmdIndex)..<line.endIndex] //substring
        
        let task = Process()
        var args: [String] = []
        task.executableURL = URL(string:"usr/bin/open")
        
        if line.starts(with: "app") {
            args.append("-a")
        }
        
        args.append(String(urlString))
        task.arguments = args
        task.launch()
        
    }
}


struct OpenView: View {
    var body: some View {
        Spacer()
            .onAppear(perform:openApps)
    }
}

struct OpenView_Previews: PreviewProvider {
    static var previews: some View {
        OpenView()
    }
}

