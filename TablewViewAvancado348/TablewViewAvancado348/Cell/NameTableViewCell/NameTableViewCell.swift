//
//  NameTableViewCell.swift
//  TablewViewAvancado348
//
//  Created by Gabriel on 29/10/22.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    static let identifier: String = "NameTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(user: User) {
        nameLabel.text = user.name
        personImage.image = user.imagePerson
        
    }


    
    
}
