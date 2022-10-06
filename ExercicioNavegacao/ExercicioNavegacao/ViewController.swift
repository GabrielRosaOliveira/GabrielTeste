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

    @IBAction func tappedTela01(_ sender: UIButton) {
        performSegue(withIdentifier: "tela01", sender: nil)
    }
}

