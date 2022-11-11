//
//  ViewController.swift
//  PrimeiroProjetoTabBar
//
//  Created by Gabriel on 10/11/22.
//

import UIKit

class Tela01ViewController: UIViewController {

    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var editFotoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addNameButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var array: [String] = []
    
    var list: [String] = ["car1", "car2", "car3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    
    }

    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        array.append(nameTextField.text ?? "")
        nameTextField.text = ""
        tableView.reloadData()
    }
}

extension Tela01ViewController: UITableViewDelegate {
    
}

extension Tela01ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.setupCell(user: User(name: array[indexPath.row], image: UIImage(named: "moto3") ?? UIImage()))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 171
    }
    
}
