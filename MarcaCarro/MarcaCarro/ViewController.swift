//
//  ViewController.swift
//  MarcaCarro
//
//  Created by Gabriel on 25/10/22.
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
    
    var data: [Cars] = [Cars(name: "Civic", image: UIImage(named: "civic") ?? UIImage()),
                        Cars(name: "Gol", image: UIImage(named: "gool") ?? UIImage()),
                        Cars(name: "Mercedes", image: UIImage(named: "mercedes") ?? UIImage()),
                        Cars(name: "Volvo", image: UIImage(named: "volvo") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarsTableViewCell.nib(), forCellReuseIdentifier: CarsTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.row].name)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.identifier, for: indexPath) as? CarsTableViewCell
        
        cell?.setupCell(cars: data[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}
