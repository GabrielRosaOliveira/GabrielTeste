//
//  ViewController.swift
//  TableVCollectionV2
//
//  Created by Gabriel on 09/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let listVehicles: [Vehicles] = [Vehicles(titel: "Carros", list: ["carro1", "carro2", "carro3", "carro4", "carro5", "carro6"]),
                                    Vehicles(titel: "Motos", list: ["carro2", "carro4", "carro5", "carro6"])]
    
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
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.identifier, for: indexPath) as? CarsTableViewCell
            cell?.setupCell(title: "Carros:", list: listVehicles)
            return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 321
    }
}
