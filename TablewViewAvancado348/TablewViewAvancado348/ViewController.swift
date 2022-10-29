//
//  ViewController.swift
//  TablewViewAvancado348
//
//  Created by Gabriel on 29/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var employeeList: [Employee] = [Employee(name: "Jorge", age: "30", profession: "Developer IOS", salary:                               "1.000,00", imageUser: UIImage(systemName: "person") ?? UIImage()),
                                    Employee(name: "Gabriel", age: "26", profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person") ?? UIImage()),
                                    Employee(name: "Lorena", age: "23", profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewCell()
    }
    
    func configTableViewCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
        tableView.register(EmployeeTableViewCell.nib(), forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    }
    
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
            cell?.setupCell(user: User(name: "Gabriel", imagePerson: UIImage(named: "user") ?? UIImage()))
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
            cell?.setupCell(employee: employeeList[indexPath.row - 1])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 108
        } else {
            return 156
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
