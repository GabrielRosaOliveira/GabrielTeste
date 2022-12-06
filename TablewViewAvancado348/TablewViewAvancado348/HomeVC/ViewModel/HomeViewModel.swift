//
//  HomeViewModel.swift
//  TablewViewAvancado348
//
//  Created by Gabriel on 01/12/22.
//

import UIKit

class HomeViewModel {

   private var employeeList: [Employee] = [
        Employee(name: "Jorge", age: "30", profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person") ?? UIImage()),
        Employee(name: "Gabriel", age: "26", profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person") ?? UIImage()),
        Employee(name: "Lorena", age: "23", profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person") ?? UIImage())]
    
    var numberOfRowsInSection: Int {
        return employeeList.count + 1
    }
    
    func seForZero(indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    func loadCurrentUser() -> User {
        return User(name: "Gabriel", imagePerson: UIImage(named: "user") ?? UIImage())
    }
    
    func loadCurrentEmployee(indexPath: IndexPath) -> Employee {
        return employeeList[indexPath.row - 1]
    }
    
    var heightForRowAt: CGFloat {
        if employeeList.count == 0 {
            return 108
        } else {
            return 156
        }
    }
    
}
