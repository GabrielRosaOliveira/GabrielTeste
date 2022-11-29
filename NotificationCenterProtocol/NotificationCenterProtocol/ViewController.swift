//
//  ViewController.swift
//  NotificationCenterProtocol
//
//  Created by Gabriel on 29/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoAppleImageView: UIImageView!
    @IBOutlet weak var nextScreenButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        configObserver()
    }

    func configElements() {
        nextScreenButton.setTitle("Clique Aqui", for: .normal)
        nextScreenButton.tintColor = .black
        nextScreenButton.backgroundColor = .white
    }
    
    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac), name: .imac, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook), name: .macbook, object: nil)
    }
    
    @objc func updateImac() {
        logoAppleImageView.image = UIImage(named: "imac_pro")
        titleLabel.text = "Imac das Galaxias"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        view.backgroundColor = .cyan
    }
    
    @objc func updateMacbook() {
        logoAppleImageView.image = UIImage(named: "macbook_pro")
        titleLabel.text = "Macbook pro"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        view.backgroundColor = .red
    }
    
    @IBAction func tappedNextScreenButton(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController
        selectionVC?.delegate = self
                selectionVC?.modalPresentationStyle = .fullScreen
                self.present(selectionVC ?? UIViewController(), animated: true)
    }
    

}

extension ViewController: Tela02ViewControllerProtocol {
    
    func tappedMacbook() {
        logoAppleImageView.image = UIImage(named: "macbook_pro")
        titleLabel.text = "Macbook pro"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        view.backgroundColor = .red
    }
    
    func tappedImac() {
        logoAppleImageView.image = UIImage(named: "imac_pro")
        titleLabel.text = "Imac das Galaxias"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        view.backgroundColor = .cyan
    }
    
    
}
