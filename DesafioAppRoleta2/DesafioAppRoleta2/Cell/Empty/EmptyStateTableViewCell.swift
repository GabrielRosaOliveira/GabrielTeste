//
//  EmptyStateTableViewCell.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 28/11/22.
//

import UIKit

class EmptyStateTableViewCell: UITableViewCell {

    @IBOutlet weak var RulletaImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = "EmptyStateTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configElementsCell()
    }


    func configElementsCell() {
        selectionStyle = .none
        backgroundColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.text = "Insira os participantes para iniciar uma roleta russa!"
        titleLabel.textColor = .white
        RulletaImageView.image = UIImage(named: "roleta")
        
    }
    
}
