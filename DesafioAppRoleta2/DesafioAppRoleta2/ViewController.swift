//
//  ViewController.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 28/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var drawNumberButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        configTableView()
    }

    func configTableView() {
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EmptyStateTableViewCell.nib(), forCellReuseIdentifier: EmptyStateTableViewCell.identifier)
    }
    
    func configElements() {
        logoImageView.image = UIImage(named: "card")
        nameTextField.placeholder = "Digite um nome:"
        drawNumberButton.setTitle("Sortear", for: .normal)
        drawNumberButton.backgroundColor = .blue
        drawNumberButton.setTitleColor(.white, for: .normal)
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.identifier, for: indexPath) as? EmptyStateTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 217
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
