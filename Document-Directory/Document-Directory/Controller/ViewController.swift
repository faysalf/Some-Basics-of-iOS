//
//  ViewController.swift
//  Document-Directory
//
//  Created by Md. Faysal Ahmed on 23/12/22.
//

import UIKit

class ViewController: UIViewController {

    let docu = DocumentsDirectory()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        docu.createFile(name: "faysalf.txt", data: "Hello This is Faysal ahmed here.")
        docu.createDirectory(name: "Another Directory")
        docu.saveUIImage(name: "Profile.jpg")
        imageView.image = docu.fetchImage(name: "Profile.jpg")
        
        docu.fetchAllFile()
    }
    

}



// All in one - Documents Directory

//    func DirectoryCreationAndDelete() {
//
//        let manager = FileManager.default
//
//        guard let url = manager.urls(for: .documentDirectory,
//                                     in: .userDomainMask).first
//        else { return }
//
//        print(url)
//        // For create a single folder
//        let newFolderUrl = url.appendingPathComponent("NewFolder")
//        // For create multiple insiding folder
//        let secondFolderUrl = url.appendingPathComponent("faysalf-1").appendingPathComponent("faysalf-2").appendingPathComponent("faysalf-3").appendingPathComponent("faysalf-4")
//
//
//        // For creating folder, first check isExist? Cause of override
//        if !manager.fileExists(atPath: secondFolderUrl.path) {
//
//            do {
//                try manager.createDirectory(at: newFolderUrl, withIntermediateDirectories: true, attributes: [:])
//            }catch {
//                print("Error:- ", error.localizedDescription)
//            }
//        }
//
//        // MARK: - For Creating file inside folder
//        let fileURL = newFolderUrl.appendingPathComponent("test.txt")
//        if !manager.fileExists(atPath: fileURL.path) {
//            let data = "Writing text to a text file Wooo!".data(using: .utf8)
//
//            manager.createFile(atPath: fileURL.path,
//                               contents: data,
//                               attributes: [FileAttributeKey.creationDate: Date()])
//        }
//
//        // MARK: - For deleting a file inside folder
////        if manager.fileExists(atPath: fileURL.path) {
////            do {
////                try manager.removeItem(at: fileURL)
////            }catch{}
////        }
//
//        // MARK: - for deleting inside folder
////        let folderURL = url.appendingPathComponent("faysalf-1").appendingPathComponent("faysalf-2")
////
////        if manager.fileExists(atPath: folderURL.path) {
////
////            do {
////                try manager.removeItem(at: folderURL)
////            }catch {}
////        }
//
//        // MARK: - To save image
//        let imgName = "Profile.jpg"
//        let imgURL = newFolderUrl.appendingPathComponent(imgName)
//
//        if !manager.fileExists(atPath: imgURL.path) {
//
//            do {
//                let img = UIImage(named: imgName)!
//                try img.jpegData(compressionQuality: 1.0)!.write(to: imgURL)
//            } catch { }
//        }
//
//
//        // MARK: - For fetching image by url
//        imageView.image = UIImage(contentsOfFile: imgURL.path)
//
//
//
//        // MARK: - Rename/Move directory
//        var newURL = newFolderUrl.appendingPathComponent("Profile.jpg")
//
//        do {
//            // Get its contents
//            let contents = try manager.contentsOfDirectory(at: newFolderUrl, includingPropertiesForKeys: nil)
//            print(contents)
//            // filter the contents that starts with "data_"
//            let dataFiles = contents.filter { $0.lastPathComponent.hasPrefix("Profil") }
//            // iterate the source files
//            for srcURL in dataFiles {
//                // create the destinations appending "newdata_" + the source lastPathComponent dropping its "data_" prefix
//                let dstURL = url.appendingPathComponent("Renamed.jpg")
//                // move/rename your files
//                try FileManager.default.moveItem(at: srcURL, to: dstURL)
//            }
//        } catch {
//            print(error)
//        }
//
//
//    }
