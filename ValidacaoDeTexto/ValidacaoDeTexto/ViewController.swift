//
//  ViewController.swift
//  ValidacaoDeTexto
//
//  Created by Gabriel on 22/09/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var cadastrarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        cadastrarButton.isEnabled = false
        
    }
    
    func configTextFields() {
        nameTextField.placeholder = "Digite seu nome"
        emailTextField.placeholder = "Digite seu endereco"
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.isSecureTextEntry = true
        cadastrarButton.backgroundColor = UIColor.gray
        cadastrarButton.layer.cornerRadius = 15
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//quando textfield estiver com foco, as bordas ficaram azuis 
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//VALIDACAO DO BOTAO
        if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" {
            cadastrarButton.isEnabled = false
        } else {
            cadastrarButton.isEnabled = true
            cadastrarButton.backgroundColor = UIColor.green
            cadastrarButton.tintColor = UIColor.yellow
        }
//VALIDANDO SE O TEXTFIELD ESTIVER VAZIO, BORDA FICARA VERMELHA
        if textField.text == "" {
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//COLOCAR FOCO E TIRAR FOCO
        if textField.isEqual(self.nameTextField) {
            emailTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        if textField.isEqual(self.emailTextField) {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        print("cadastro realizado com sucesso")
        
    }
    
    
}

