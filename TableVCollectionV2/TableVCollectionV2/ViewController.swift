//
//  ViewController.swift
//  TableVCollectionV2
//
//  Created by Gabriel on 09/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let listVehicles: [Vehicles] = [Vehicles(titel: "Carros", list: ["car1", "car2", "car3", "car4", "car5", "car6"]),
                                    Vehicles(titel: "Motos", list: ["car2", "car4", "car5", "car6"])]
    
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
        cell?.setupCell(title: "Carros:", list: listVehicles[indexPath.row].list)
            return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 321
    }
}
