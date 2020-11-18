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
        DocumentGroup(newDocument: Workspace_ManagerDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
 
