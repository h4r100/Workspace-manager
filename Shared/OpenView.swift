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

