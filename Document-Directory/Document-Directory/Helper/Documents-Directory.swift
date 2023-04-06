//
//  ViewController.swift
//  Document-Directory
//
//  Created by Md. Faysal Ahmed on 23/12/22.
//

import UIKit

let manager = FileManager.default
let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first!

class DocumentsDirectory {
    
    static let DocumentDirectory = DocumentsDirectory()
    var newFolderURL = url.appendingPathComponent("New Folder")
    
    
    func createDirectory(name: String) {
        
        if !manager.fileExists(atPath: newFolderURL.path) {
            do {
                try manager.createDirectory(at: newFolderURL, withIntermediateDirectories: true, attributes: [:])
            }catch {
                print("Error:- ", error.localizedDescription)
            }
        }
    }
    
    
    func createFile(name: String, data: String?) {
        if !manager.fileExists(atPath: newFolderURL.path) {
            createDirectory(name: name)
        }
        let fileURL = newFolderURL.appendingPathComponent(name)
        
        if !manager.fileExists(atPath: fileURL.path) {
            let data = data!.data(using: .utf8)
            
            manager.createFile(atPath: fileURL.path,
                               contents: data,
                               attributes: [FileAttributeKey.creationDate: Date()])
        }
    }
    
    
    func deleteFile(name: String) {
        let fileURL = newFolderURL.appendingPathComponent(name)
        
        if manager.fileExists(atPath: fileURL.path) {
            do {
                try manager.removeItem(at: fileURL)
            }catch{
                print("Error: - ", error.localizedDescription)
            }
        }

    }
    
    
    func deleteDirectory() {
        do {
            try manager.removeItem(at: newFolderURL)
        }catch {
            print("Error: - ", error.localizedDescription)
        }
    }
    
    
    func saveUIImage(name: String) {
        let imgURL = newFolderURL.appendingPathComponent(name)
        
        if !manager.fileExists(atPath: imgURL.path) {
            do {
                let img = UIImage(named: name)!
                try img.jpegData(compressionQuality: 1.0)!.write(to: imgURL)
            } catch {
                print("Error:- ", error.localizedDescription)
            }
        }
        else {
            let alert = UIAlertController(title: "Alert!!!", message: "Do you want to raplace it?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {_ in
                do {
                    let img = UIImage(named: name)!
                    try img.jpegData(compressionQuality: 1.0)!.write(to: imgURL)
                } catch {
                    print("Error:- ", error.localizedDescription)
                }
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in }))
            
            // present(alert, animated: true)
        }
    }
    
    
    func fetchImage(name: String) -> UIImage {
        let imgURL = newFolderURL.appendingPathComponent(name)
        
        return UIImage(contentsOfFile: imgURL.path)!
    }
    
    
    func saveGifImage(fileUrl: URL) {
        let folderUrl = newFolderURL as URL
        
        let fileName = "faysalGif"
        let permanentFileURL = folderUrl.appendingPathComponent(fileName, conformingTo: .gif)
        
        if let gifData = try? Data(contentsOf: fileUrl) {
            try? gifData.write(to: permanentFileURL)
            print("successfully save gif ")
        }else{
            print("error")
        }
        
    }
    
    // if needed to fetch a specific folder file then we need that folder name. !nil
    func fetcGifPhoto(_ folderName: String?=nil, success: @escaping(_ arr: [URL]) -> Void) {
        let folderUrl = newFolderURL
        var gifImageArr: [URL] = []
        do {
            let fileUrl = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: [.contentTypeKey], options: [.skipsHiddenFiles]).filter { $0.pathExtension == "gif"}
            for url in fileUrl {
                gifImageArr.append(url)
            }
            success(gifImageArr)
        }catch {
            print(error.localizedDescription)
        }

    }

    
    
    func renameOrMoveDirectory(oldName: String, replacingName: String) {
        do {
            // Get its contents
            let contents = try manager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            print("Contents: -", contents)
            // filter the contents that starts with "NewFo"
            let dataFiles = contents.filter{ $0.lastPathComponent.hasPrefix(oldName) }
            // iterate the source files
            for srcURL in dataFiles {
                // create the destinations appending "newdata_" + the source lastPathComponent dropping its "data_" prefix
                let dstURL = url.appendingPathComponent(replacingName)
                // move/rename your files
                try FileManager.default.moveItem(at: srcURL, to: dstURL)
            }
        } catch {
            print(error)
        }
    }
    
    
    func fetchAllFile() {
        
        do{
            let files = try manager.contentsOfDirectory(atPath: newFolderURL.path)
            for filename in files {
                print(filename)
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }



}

