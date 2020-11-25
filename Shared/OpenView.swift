//
//  OpenView.swift
//  Workspace-Manager
//
//  Created by Srihari on 25/11/20.
//

import SwiftUI

let document = Workspace_ManagerDocument()

struct OpenView: View {
    var body: some View {
        VStack {
            Text(document.text)
                .frame(width: 500, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Opened")
                .frame(width: 500, height: 100, alignment: .top)
        }
    }
}

struct OpenView_Previews: PreviewProvider {
    static var previews: some View {
        OpenView()
    }
}
