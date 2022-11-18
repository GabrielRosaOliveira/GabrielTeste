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
    
    @IBOutlet weak var digiteNameLabel: UILabel!
    
    
    var array: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        personImageView.tintColor = .white
    }
    

    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        array.append(User(name: nameTextField.text ?? "", image: UIImage(systemName: "person") ?? UIImage()))
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
        cell?.setupCell(user: array[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 171
    }
    
}
