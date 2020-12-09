//
//  Workspace_ManagerApp.swift
//  Shared
//
//  Created by Srihari on 18/11/20.
//

import SwiftUI

@main
struct Workspace_ManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(document: .constant(Workspace_ManagerDocument()))
        }
        DocumentGroup(newDocument: Workspace_ManagerDocument()) { file in //runs this if launched normally
            CreateNewFile(document: file.$document)
        }
    }
}
