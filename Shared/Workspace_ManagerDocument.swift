//
//  Workspace_ManagerDocument.swift
//  Shared
//
//  Created by Srihari on 18/11/20.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var wmsho: UTType {
        UTType(exportedAs: "com.HAndO.wmsho")
    }
}

struct Workspace_ManagerDocument: FileDocument {
    var text: String

    init(text: String = "app /Applications/Spotify.app") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.wmsho] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
