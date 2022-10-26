//
//  CarsTableViewCell.swift
//  MarcaCarro
//
//  Created by Gabriel on 25/10/22.
//

import UIKit

// Criar a celula
// Criar identifier
// Add identifier na xib
// Criar metodo da Nib
// Criar os elementos e fazer as suas ligações
// Configurar Elementos
// Criar metodo de Setup!!!!!!!

class CarsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameCarLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    static let identifier: String = "CarsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupCell(cars: Cars) {
        nameCarLabel.text = cars.name
        carImage.image = cars.image
    }
}
