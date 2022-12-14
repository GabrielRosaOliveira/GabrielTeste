//
//  HistoryTableViewCell.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 13/12/22.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let identifier: String = "HistoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell(data: HistoryAccountList) {
        iconImageView.image = UIImage(named: data.iconImage ?? "")
        nameLabel.text = "nome: \(data.name ?? "")"
        priceLabel.text = "Preço: \(String(data.price ?? 0.0))"
    }

    
    
}
