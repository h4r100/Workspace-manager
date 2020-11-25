//
//  OpenView.swift
//  Workspace-Manager
//
//  Created by Srihari on 25/11/20.
//

import SwiftUI
import Foundation

//from: https://stackoverflow.com/questions/26971240/how-do-i-run-a-terminal-command-in-a-swift-script-e-g-xcodebuild/31510860#31510860
//allows for running of terminal commands
@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

let document = Workspace_ManagerDocument()
let files = FileManager()

func openApps() {
    let lines = document.text.components(separatedBy: .newlines)
    for line in lines {
        guard let cmdIndex = line.firstIndex(of: " ") else { return }
        let urlString = line[(cmdIndex)..<line.endIndex] //substring
        if line.starts(with: "app") {
            shell("open", "-a", String(urlString))
        } else if line.starts(with: "file") || line.starts(with: "website") {
            shell("open", String(urlString))
        } else {
            print("invalid call for ", String(urlString))
        }
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
