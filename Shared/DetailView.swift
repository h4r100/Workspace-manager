//
//  DetailView.swift
//  Workspace-Manager
//
//  Created by Owen Park on 3/12/20.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        let n = 5
        
        NavigationView {
            GroupBox(label: Text("Files")) {
                VStack {
                    ForEach (0..<n) {_ in
                        NavigationLink(destination: CreateNewFile(), label: {Text("names")})
                    }
                }
                
            }
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
