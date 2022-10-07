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
    
    
    @IBAction func tappedModalButton(_ sender: UIButton) {
        //        exibindo tela por MODAL
        let vc = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
        present(vc ?? UIViewController(), animated: true)
    }
    
    
    @IBAction func tappedPushButton(_ sender: UIButton) {
        //        exibindo tela por NAVIGATION
        let vc = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
}

