//
//  Tela02ViewController.swift
//  NotificationCenterProtocol
//
//  Created by Gabriel on 29/11/22.
//

import UIKit

protocol Tela02ViewControllerProtocol: AnyObject {
    func tappedMacbook()
    func tappedImac()
}

class Tela02ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var macbookButton: UIButton!
    @IBOutlet weak var imacButton: UIButton!
    
    weak var delegate: Tela02ViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configElements()
    }

    func configElements() {
        titleLabel.text = "Opções"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .yellow
       
    }

    
    @IBAction func tappedMacbookButton(_ sender: UIButton) {
//        NotificationCenter.default.post(name: .macbook, object: nil)
        delegate?.tappedMacbook()
        dismiss(animated: true)
    }
    
    @IBAction func tappedImacButton(_ sender: UIButton) {
//        NotificationCenter.default.post(name: .imac, object: nil)
        delegate?.tappedImac()
        dismiss(animated: true)
    }
    
}
