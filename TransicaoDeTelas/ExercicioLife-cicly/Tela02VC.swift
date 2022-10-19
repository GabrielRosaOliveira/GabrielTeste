//
//  Tela02VC.swift
//  ExercicioLife-cicly
//
//  Created by Gabriel on 11/10/22.
//

import UIKit

class Tela02VC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    var name: String = ""
    var lastName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        
    }
    

    

}
