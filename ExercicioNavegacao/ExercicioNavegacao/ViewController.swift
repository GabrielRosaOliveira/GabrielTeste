//
//  ViewController.swift
//  ExercicioNavegacao
//
//  Created by Gabriel on 06/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tappedGOTela02Button(_ sender: UIButton) {
        performSegue(withIdentifier: "GoTela02", sender: nil)
    }
    
}

