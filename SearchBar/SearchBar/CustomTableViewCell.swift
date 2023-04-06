//
//  CustomTableViewCell.swift
//  SearchBar
//
//  Created by Md. Faysal Ahmed on 26/3/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var star: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(img: String, name: String, star: Double, location: String) {
        self.imgView.loadImageFromUrl(img)
        self.name.text = name
        self.star.text = "\(star)"
        self.location.text = location
    }
    
}
