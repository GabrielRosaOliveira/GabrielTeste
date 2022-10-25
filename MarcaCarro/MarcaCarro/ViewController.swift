//
//  ViewController.swift
//  MarcaCarro
//
//  Created by Gabriel on 25/10/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    let data: [Cars] = [Cars(name: "Civic", image: UIImage(named: "civic") ?? UIImage()),
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.identifier, for: indexPath) as? CarsTableViewCell
        
        cell?.setupCell(cars: data[indexPath.row])
        
        
        return cell ?? UITableViewCell()
    }
    
    
}
