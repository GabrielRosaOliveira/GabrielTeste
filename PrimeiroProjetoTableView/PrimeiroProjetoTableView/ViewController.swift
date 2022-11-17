//
//  ViewController.swift
//  PrimeiroProjetoTableView
//
//  Created by Gabriel on 20/10/22.
//

import UIKit

// Passo a passo
// Criar a TableView
// Fazer a ligação
// Configurar a tableView
// Criar Celula
// Configurar Celula
// Registrar a Celula
// Configurar Exibicao da Celula

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = ["Gabriel", "Lorena", "Marlei", "Daniel", "Aline", "Sara"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource {
//    Indicar a quantidade de linhas por sessao
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
//    Popular a celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
        cell?.setupCell(name: data[indexPath.row])
        
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        data.append("julia")
        data.remove(at: 0)
    }
    
}
