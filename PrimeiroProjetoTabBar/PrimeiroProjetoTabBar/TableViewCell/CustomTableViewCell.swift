//
//  CustomTableViewCell.swift
//  PrimeiroProjetoTabBar
//
//  Created by Gabriel on 10/11/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var paisagemImageView: UIImageView!
    
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var data: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell(title: String, image: String) {
        titleLabel.text = title
        paisagemImageView.image = UIImage(named: image)
    }
 
    func setupCell2(user: User) {
        titleLabel.text = user.name
        paisagemImageView.image = user.image
    }
    
}
