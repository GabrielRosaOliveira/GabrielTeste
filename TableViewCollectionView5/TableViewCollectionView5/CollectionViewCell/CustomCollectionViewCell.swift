//
//  CustomCollectionViewCell.swift
//  TableViewCollectionView5
//
//  Created by Gabriel on 08/11/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    
    static let identifier: String = "CustomCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(carImage: String) {
        carImageView.image = UIImage(named: carImage)
    }

}
