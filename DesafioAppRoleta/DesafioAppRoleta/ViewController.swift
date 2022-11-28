//
//  ViewController.swift
//  DesafioAppRoleta
//
//  Created by Gabriel on 24/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var raffleButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var listPerson: [Person] = []
    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configElements()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(EmptyStateTableViewCell.nib(), forCellReuseIdentifier: EmptyStateTableViewCell.identifier)
        tableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
    @IBAction func tappedRaffleButton(_ sender: UIButton) {
    }
    
    func configElements() {
        cardImageView.image = UIImage(named: "card")
        nameTextField.placeholder = "Digite um nome"
        raffleButton.setTitle("Sortear", for: .normal)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listPerson.count == 0 {
            return 1
        } else {
            return listPerson.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if listPerson.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.identifier, for: indexPath) as? EmptyStateTableViewCell
            cell?.setupCell(image: "roleta", title: "Insira os participantes para iniciar uma roleta russa!")
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listPerson.count == 0 {
            return 158
        } else {
            return 98
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
