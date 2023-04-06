//
//  CustomTableViewCell.swift
//  MVVM-Demo
//
//  Created by Md. Faysal Ahmed on 19/3/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    static let identifier = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    public func configure(with viewModel: CellViewModel) {
        myLabel.text = "\(viewModel.firstName) \(viewModel.lastName)"
    }
    
    
}
