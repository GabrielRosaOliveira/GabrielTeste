//
//  PersonTableViewCell.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 28/11/22.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    static let identifier: String = "PersonTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    func setupCell(data: Person) {
        nameLabel.text = data.name
        personImageView.image = UIImage(named: data.image)
    }
 
    func configElementsCell() {
        cardImageView.image = UIImage(named: "credit-card")
        backgroundColor = .black
        selectionStyle = .none
        nameLabel.textColor = .white
    }
    
}
