//
//  ViewController.swift
//  RealmDatabaseToSaveGif
//
//  Created by Md. Faysal Ahmed on 8/1/23.
//

import UIKit
import RealmSwift

class task: Object {
    @objc dynamic var gf: Data!
}

var deleteRow: Int = -1

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var realm = try! Realm()
    var doc = DocumentsDirectory()
    var gifDataArray = [task]()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSetUp()
        
//        saveGif(name: "gif")
//        saveGif(name: "giphy")
//        saveGif(name: "gif2")
//        saveGif(name: "gif3")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchingData()
        collectionView.reloadData()

    }
    
    
    func collectionViewSetUp() {
        let nib = UINib(nibName: "collectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    func saveGif(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "gif") else { return }

        try! self.realm.write {
            var img = task()
            img.gf = try! Data(contentsOf: url)
            self.realm.add(img)
        }
    }
    
    
    func fetchingData() {
        let notes = realm.objects(task.self)

        if(!notes.isEmpty) {
            for n in notes {
                gifDataArray.append(n)
            }
        }

    }
    

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return gifDataArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
        cell.imageView.image = UIImage.gif(data: gifDataArray[indexPath.row].gf)
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteItemFromCV), for: .touchUpInside)
        
        return cell
    }
    
    
    @objc func deleteItemFromCV(sender: UIButton) {
        
        if let photoCVCell = sender.superview?.superview as? collectionViewCell {
            
            guard let indexPath = collectionView.indexPath(for: photoCVCell) else { return }
            
            let alert = UIAlertController(title: "Do you really want to delete?", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.realm.beginWrite()
                self.realm.delete(self.gifDataArray[indexPath.row])
                try! self.realm.commitWrite()
                
                self.gifDataArray.remove(at: indexPath.row)
                self.collectionView.deleteItems(at: [indexPath])
                
                self.collectionView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(alert, animated: true)
            
        }
            
    }
    
    
    // MARK: - collectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sz = self.view.frame.width/3 - 5
        return CGSize(width: sz, height: sz)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    
}
