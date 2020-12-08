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

struct CreateNewFile: View {
    var body: some View {
        Text("this is creating a new file")
            .frame(width: 300, height: 300)
        //.onAppear(perform:openApps)
    }
}

struct CreateNewFile_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewFile()
    }
}
