//
//  NameTableViewCell.swift
//  PrimeiroProjetoTableView
//
//  Created by Gabriel on 20/10/22.
//

import UIKit

// Criar a celular
// Criar a identifier
// add identifier na xib
// criar metodo da Nib
// criar os elementos e fazer suas ligacoes
// configurar elementos
// criar metodo de Setup!!!!


class NameTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = "NameTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
//    ciclo de vida da celula
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell(name: String) {
        nameLabel.text = name
    }

    
}
