//
//  collectionViewCellCollectionViewCell.swift
//  RealmDatabaseToSaveGif
//
//  Created by Md. Faysal Ahmed on 10/1/23.
//

import UIKit

class collectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    let vc = ViewController()
    
    var arr = [Data]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    @IBAction func removeButtonAction(_ sender: UIButton) {
        let idx: Int = sender.tag
        //vc.gifDataArray.remove(at: idx)
        //vc.collectionView.reloadData()
        deleteRow = idx
        print(idx)
    }
    
    

}
