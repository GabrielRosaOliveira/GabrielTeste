//
//  ViewController.swift
//  AppAlcoolOuGasolina
//
//  Created by Gabriel on 25/09/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var priceAlcool: UITextField!
    @IBOutlet weak var priceGasolina: UITextField!
    
    @IBOutlet weak var calcPriceButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configsButtonAndLabel()
        configTextFields()
        priceAlcool.delegate = self
        priceGasolina.delegate = self
        calcPriceButton.isEnabled = false
        botaDesabilitado()
    }
    
    func calcularCombustivel() {
        //LOGICA DO CALCULO
        let alcool: Double = Double(priceAlcool.text ?? "0") ?? 0
        let gasolina: Double = Double(priceGasolina.text ?? "0") ?? 0
        if alcool / gasolina > 0.70 {
            resultLabel.text = "Se o preço do Alcool for R$:\(String(format: "%.2f", alcool)) e a Gasolina for a R$:\(String(format: "%.2f", gasolina)) compensa abastecer com Gasolina"
        } else if alcool / gasolina <= 0.70 {
            resultLabel.text = "Se o preço do Alcool for R$:\(String(format: "%.2f", alcool)) e a Gasolina for a R$:\(String(format: "%.2f", gasolina)) compensa abastecer com Alcool"
        } else {
            resultLabel.text = "Não consegui calcular, tente novamente!!!"
        }
    }
    
    func configsButtonAndLabel() {
        calcPriceButton.tintColor = .black
        calcPriceButton.setTitle("Calcular", for: .normal)
        calcPriceButton.layer.cornerRadius = 20
        
        titleLabel.text = "Digite os Preços!"
        titleLabel.backgroundColor = .blue
        titleLabel.textColor = .white
        titleLabel.layer.cornerRadius = 20
        titleLabel.layer.masksToBounds = true
        resultLabel.text = "Aguardando calculo"
    }
    
    func configTextFields() {
        priceAlcool.placeholder = "Ex:1.99"
        priceGasolina.placeholder = "Ex:2.99"
        priceAlcool.textAlignment = .center
        priceGasolina.textAlignment = .center
    }
    
    
    @IBAction func tappedCalcButton(_ sender: UIButton) {
        calcularCombustivel()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //QUANDO SUBIR TECLADO, BORDA DO TEXTFIELD FICARA AZUL
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // VALIDACAO SE O TEXTFIELD ESTIVER VAZIO, FICARA COM BORDAS VERMELHAS
        if textField.text == "" {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 0
        }
        botaDesabilitado()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func botaDesabilitado() {
        // validacao do botao calcular
        if priceAlcool.text == "" || priceGasolina.text == "" {
            calcPriceButton.isEnabled = false
            calcPriceButton.backgroundColor = .gray
        } else {
            calcPriceButton.isEnabled = true
            calcPriceButton.backgroundColor = UIColor(red: 243/255, green: 247/255, blue: 0/255, alpha: 1.0)
        }
    }
}

