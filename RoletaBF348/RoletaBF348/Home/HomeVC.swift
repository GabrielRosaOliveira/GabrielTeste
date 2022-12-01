//
//  ViewController.swift
//  RoletaBF348
//
//  Created by Caio Fabrini on 24/11/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var logoAppImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var drawNumberButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var viewModel: HomeViewModel = HomeViewModel()
    // DICA: REMOVER TODOS OS OBJETOS DA HOMEVC, POIS DEVEM PERMANECER PRIVATE NA VIEWMODEL
  
    var alert: AlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = AlertController(controller: self)
        configTableView()
        configTextEndColors()
        blockedDrawNumberButton()
    }
    
    func configTextEndColors() {
        nameTextField.placeholder = "Digite um nome"
        nameTextField.delegate = self
        tableView.backgroundColor = .black
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.separatorStyle = .none
        tableView.register(EmptyTableViewCell.nib(), forCellReuseIdentifier: EmptyTableViewCell.identifier)
        tableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
    func blockedDrawNumberButton() {
        if viewModel.isListPersonEmpty {
            drawNumberButton.isEnabled = false
            drawNumberButton.alpha = 0.5
        } else {
            drawNumberButton.isEnabled = true
            drawNumberButton.alpha = 1
        }
    }

    @IBAction func tappedDrawNumberButton(_ sender: UIButton) {
        viewModel.drawNumber()
    }
    
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.checkPersonPayer(indexPath: indexPath) {
            print("parabens você foi sorteado, então pague a conta")
            alert?.showAlert(title: "Muitoo bom", message: "Agora é sua vez, pague a conta ;)")
            viewModel.removeAll()
        } else{
            print("uffa, você escapou")
            viewModel.removePerson(indexPath: indexPath)
        }
        blockedDrawNumberButton()
        tableView.reloadData()
    }
    
}

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isListPersonEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            cell?.setupCell(data: viewModel.loadCurrentPerson(indexPath: indexPath))
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
}

extension HomeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if viewModel.shouldReturn(textField: textField) {
            viewModel.myListImageAndPerson(textField: textField)
            tableView.reloadData()
            blockedDrawNumberButton()
        }
        viewModel.textFieldEmpty(textFiled: textField)
        return true
    }
}






