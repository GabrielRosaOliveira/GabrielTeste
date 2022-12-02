//
//  EmployeeTableViewCell.swift
//  TablewViewAvancado348
//
//  Created by Gabriel on 29/10/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var viewModel: EmployeeTableViewModel = EmployeeTableViewModel()
    
    static let identifier: String = "EmployeeTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(employee: Employee) {
        peopleImage.image = employee.imageUser
        nameLabel.text = "Nome: \(employee.name)"
        ageLabel.text = "Idade: \(employee.age)"
        jobLabel.text = "Profissão: \(employee.profession)"
        moneyLabel.text = "Salario: \(employee.salary)"
        
    }
    
    
}
