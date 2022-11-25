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
    
    var Empty: [EmptyState] = [EmptyState(image: UIImage(named: "roleta") ?? UIImage(), title: "Isira os participantes para iniciar uma roleta russa;")]
    
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
    }
    
    @IBAction func tappedRaffleButton(_ sender: Any) {
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
        return Empty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.identifier, for: indexPath) as? EmptyStateTableViewCell
        cell?.setupCell(empty: Empty[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158
    }
    
}
