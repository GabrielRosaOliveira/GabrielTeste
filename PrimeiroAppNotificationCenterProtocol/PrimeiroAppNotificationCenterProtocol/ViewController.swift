//
//  ViewController.swift
//  PrimeiroAppNotificationCenterProtocol
//
//  Created by Gabriel on 22/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var appleImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var clickButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        configObserver()
        
    }
    
    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac), name: .imac, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook), name: .macbook, object: nil)
    }

    @objc func updateImac() {
        print(#function)
        resultLabel.text = "Imac das Galaxias"
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
        appleImageView.image = UIImage(named: "imac_pro")
        view.backgroundColor = .red
    }
    
    @objc func updateMacbook() {
        print(#function)
        resultLabel.text = "Macbook pro"
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        appleImageView.image = UIImage(named: "macbook_pro")
        view.backgroundColor = .yellow
    }
    
    @IBAction func tappedClickButton(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewControllerProtocol
        selectionVC?.modalPresentationStyle = .fullScreen
                self.present(selectionVC ?? UIViewController(), animated: true)
    }
    
    func configElements() {
        appleImageView.tintColor = .white
        clickButton.setTitle("Clique Aqui", for: .normal)
    }
    
}

