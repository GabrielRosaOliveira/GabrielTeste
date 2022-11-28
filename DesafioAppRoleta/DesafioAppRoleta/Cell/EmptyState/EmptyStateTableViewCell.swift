//
//  EmptyStateTableViewCell.swift
//  DesafioAppRoleta
//
//  Created by Gabriel on 24/11/22.
//

import UIKit

class EmptyStateTableViewCell: UITableViewCell {

    @IBOutlet weak var rouletteImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    
    static let identifier: String = "EmptyStateTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    func setupCell(image: String, title: String) {
        rouletteImageView.image = UIImage(named: image)
        titleLabel.text = title
    }
    
    func configElements() {
        selectionStyle = .none
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
    }
    
}
