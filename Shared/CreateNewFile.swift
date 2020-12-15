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
    for line in lines {
        
        let task = Process()
        task.executableURL = URL(fileURLWithPath:"/usr/bin/open")
        
        task.arguments = [line]
    
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
        VStack {
            TextEditor(text: $document.text)
                .frame(width: 300, height: 300)
                .onAppear(perform:{openApps(doc: document)})
            Button(action: {openApps(doc:document)}) {
                Label("Open", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct CreateNewFile_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewFile(document: .constant(Workspace_ManagerDocument()))
    }
}
