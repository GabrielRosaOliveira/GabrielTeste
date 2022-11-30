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
    
    var listPerson: [Person] = []
    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    var person: Person?
    var alert: AlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = AlertController(controller: self)
        configElements()
        configTableView()
        nameTextField.delegate = self
        blockDrawButton()
        
    }

    func configTableView() {
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.register(EmptyStateTableViewCell.nib(), forCellReuseIdentifier: EmptyStateTableViewCell.identifier)
        tableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
    @IBAction func tappedDrawNumberButton(_ sender: UITextField) {
        self.person = listPerson.randomElement()
        dump(person)
    }
    
    
    func configElements() {
        logoImageView.image = UIImage(named: "card")
        nameTextField.placeholder = "Digite um nome:"
        drawNumberButton.setTitle("Sortear", for: .normal)
        drawNumberButton.backgroundColor = .blue
        drawNumberButton.setTitleColor(.white, for: .normal)
    }
    
    func blockDrawButton() {
        if listPerson.isEmpty {
            drawNumberButton.isEnabled = false
            drawNumberButton.alpha = 0.5
        } else {
            drawNumberButton.isEnabled = true
            drawNumberButton.alpha = 1
        }
        
    }
    

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dump(self.listPerson[indexPath.row])
        if self.listPerson[indexPath.row] === self.person {
            print("parabens você foi sorteado, então pague a conta")
            alert?.showAlert(title: "Muitoo bom", message: "Agora é sua vez, pague a conta ;)")
            listPerson.removeAll()
        } else{
            listPerson.remove(at: indexPath.row)
            
            print("uffa, você escapou")
        }
        blockDrawButton()
        tableView.reloadData()
    }
    
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
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listPerson.count == 0 {
            return 217
        } else {
            return 88
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if !(textField.text?.isEmpty ?? false) {
            listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
            tableView.reloadData()
        }
        blockDrawButton()
        textField.text = ""
        return true
    }
    
}
