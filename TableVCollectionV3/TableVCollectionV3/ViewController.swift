//
//  ViewController.swift
//  TableVCollectionV3
//
//  Created by Gabriel on 09/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let carList: [String] = ["car1", "car2"]
    let bikeList: [String] = ["moto1", "moto2", "moto3"]
    
    let newList: [Vehicles] = [Vehicles(title: "Carros:", list: ["car1", "car2", "car3", "car4", "car5"]),
                               Vehicles(title: "Motos:", list: ["moto1", "moto2", "moto3"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
        cell?.setupCell(name: newList[indexPath.row].list, title: newList[indexPath.row].title)
            return cell ?? UITableViewCell()

      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
}
