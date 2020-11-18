//
//  files.swift
//  Workspace Manager
//  This is where all the file-editing and reading methods are stored, can be
//  called within the project.
//
//  Created by Srihari on 1/11/20.
//

import Foundation

let fileManager = FileManager()

struct OpenSequence {
    var test: Int = 0;
    init(test: Int) {
        self.test = test;
    }
}

func createFile(path: URL) -> Bool {
    if fileManager.fileExists(atPath: path.path) {
        print("File already exists")
        return false
    } else {
        fileManager.createFile(atPath: path.path, contents: nil, attributes: nil)
        return true
    }
}

func deleteFile(location: URL) -> Bool {
    if fileManager.isDeletableFile(atPath: location.path) {
        do {
            try fileManager.removeItem(at: location)
        } catch {
            print("unable to delete")
            return false
        }
        return true
    } else {
        print("unable to delete")
        return false
    }
}

func readFile(at: URL) -> String {
    let exists: Bool = fileManager.fileExists(atPath: at.path)
    var contents: String
    if exists {
        do {
            contents = try String(contentsOf: at, encoding: .utf8)
        } catch {
            return ""
        }
        return contents
    } else {
        return ""
    }
}

//overwrite mode is possible only if correctly specified, else will add
//NOTE: inefficient as it needs to read entire file and write again
func writeToFile(location: URL, contents: String, mode: String) -> Bool {
    let exists: Bool = fileManager.fileExists(atPath: location.path)
    var writeableContents = contents
    
    if exists {
        if mode != "overwrite" {
            writeableContents = contents + readFile(at:location)
        }
        do {
            try writeableContents.write(to: location, atomically: true, encoding: .utf8)
        } catch {
            print("something died")
            return false
        }
        return true
    } else {
        return false
    }
}
