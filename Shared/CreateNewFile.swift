//
//  CreateNewFile.swift
//  Workspace-Manager
//
//  Created by Owen Park on 3/12/20.
//

import SwiftUI

// https://ourcodeworld.com/articles/read/1117/how-to-implement-a-file-and-directory-picker-in-macos-using-swift-5

func filePicker() -> String {
    let openPanel = NSOpenPanel()
    openPanel.title = "Choose a file or application"
    openPanel.showsResizeIndicator = true
    openPanel.allowedFileTypes = ["wmsho"]
    
    if openPanel.runModal() == NSApplication.ModalResponse.OK {
        let result = openPanel.url
        if (result != nil) {
            return result!.path
        }
        else {
            return "false"
        }
    }
    return "false"
}

func openApps(doc: Workspace_ManagerDocument) {
    
    let lines = doc.text.components(separatedBy: .newlines)
    print("separated")
    for line in lines {
        
        let task = Process()
        task.currentDirectoryPath = "/"
        task.executableURL = URL(fileURLWithPath:"/usr/bin/open")
        task.arguments = []
        print("created process")
        
        let cmds = line.components(separatedBy: .whitespaces)
        if cmds[0] == "app" {
            task.arguments?.append("-a")
        }
        for i in 1...(cmds.capacity-1) {
            print (cmds[i])
            task.arguments?.append(cmds[i])
        }
        print("added arguments")
        
        do {
            try task.run()
        } catch {
            print(error)
        }
        
    }
}

struct CreateNewFile: View {
    @Binding var document: Workspace_ManagerDocument
    
    var body: some View {
        TextEditor(text: $document.text)
            .frame(width: 300, height: 300)
            .onAppear(perform:{openApps(doc: document)})
    }
}

struct CreateNewFile_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewFile(document: .constant(Workspace_ManagerDocument()))
    }
}
