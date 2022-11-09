//
//  CustomCollectionViewCell.swift
//  TableVCollectionV1
//
//  Created by Gabriel on 09/11/22.
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
        carImageView.contentMode = .scaleAspectFill
        
    }
    
    func setupCell(listImage: String) {
        carImageView.image = UIImage(named: listImage)
    }

}
