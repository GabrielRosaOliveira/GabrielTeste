//
//  CarsTableViewCell.swift
//  MarcaCarro
//
//  Created by Gabriel on 25/10/22.
//

import UIKit

class CarsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameCarLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    static let identifier: String = "CarsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func setupCell(cars: Cars) {
        nameCarLabel.text = cars.name
        carImage.image = cars.image
    }


    
}
