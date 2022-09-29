//
//  ViewController.swift
//  ValidacaoDeCampo2
//
//  Created by Gabriel on 28/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        addressTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        configTextFieldsAndButton()
        validacaoDoBotaoCadastro()
    }

    func configTextFieldsAndButton() {
        nameTextField.placeholder = "Digite seu nome"
        addressTextField.placeholder = "Digite seu email"
        passwordTextField.placeholder = "Digite sua senha"
        confirmPasswordTextField.placeholder = "Confirmar sennha"
        
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = .purple
        registerButton.layer.cornerRadius = 19
    }
    
    func validacaoDoBotaoCadastro() {
        if nameTextField.text == "" || addressTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            registerButton.isEnabled = false
            registerButton.backgroundColor = .gray
        } else {
            registerButton.isEnabled = true
            registerButton.backgroundColor = .purple
        }
    }
    
    func validacaoDasSenhasIguais() {
        if passwordTextField.text != confirmPasswordTextField.text {
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            confirmPasswordTextField.layer.borderWidth = 2
            confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
            registerButton.isEnabled = false
        } else {
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
            confirmPasswordTextField.layer.borderWidth = 2
            confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
            registerButton.isEnabled = true
        }
    }
}

extension ViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text != "" {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.green.cgColor
        } else {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.blue.cgColor
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
        validacaoDasSenhasIguais()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
