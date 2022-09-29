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
        
    }
    
    func configTextFieldsAndButton() {
        nameTextField.placeholder = "Digite seu nome"
        addressTextField.placeholder = "Digite seu email"
        passwordTextField.placeholder = "Digite sua senha"
        confirmPasswordTextField.placeholder = "Confirme sua senha"
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.backgroundColor = .purple
        registerButton.isEnabled = false
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        print("Cadastro Realizado com sucesso")
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //QUANDO TEXTFIELD ESTIVER COM FOCO, A BORDA FICARA AZUL
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        VALIDACAO SE OS CAMPOS ESTIVEREM VAZIO OU NAO
        if textField.text == "" {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        //        VALIDACAO SE AS SENHAS ESTIVEREM DIFERENTES
        if passwordTextField.text != confirmPasswordTextField.text {
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            confirmPasswordTextField.layer.borderWidth = 2
            confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            passwordTextField.layer.borderWidth = 0
            confirmPasswordTextField.layer.borderWidth = 0
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        //        VALIDACAO PARA O BOTAO CADASTRAR
        if nameTextField.text == "" || addressTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            registerButton.isEnabled = false
        } else if passwordTextField.text == confirmPasswordTextField.text {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
