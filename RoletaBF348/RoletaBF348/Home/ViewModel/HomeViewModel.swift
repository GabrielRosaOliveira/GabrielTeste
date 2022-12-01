//
//  HomeViewModel.swift
//  RoletaBF348
//
//  Created by Caio Fabrini on 29/11/22.
//

import UIKit

class HomeViewModel {

    private var listPerson: [Person] = []
    private var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    private var person: Person?
    
   
    
    // primeira abordagem -> variavel computada
    var isListPersonEmpty: Bool {
        return listPerson.isEmpty
    }
    
    // segunda abordagem -> funcao com retorno
    
//    func isListPersonEmpty() -> Bool {
//        return listPerson.isEmpty
//    }
    
    func drawNumber() {
        self.person = listPerson.randomElement()
    }
    
    
    func checkPersonPayer(indexPath: IndexPath) -> Bool {
        return self.listPerson[indexPath.row] === self.person
    }
    
    func removeAll() {
        listPerson.removeAll()
    }
    
    func removePerson(indexPath: IndexPath) {
        listPerson.remove(at: indexPath.row)
    }
    
    
    var numberOfRowsInSection: Int {
        if isListPersonEmpty {
            return 1
        } else {
            return listPerson.count
        }
    }
    
    
    func loadCurrentPerson(indexPath: IndexPath) -> Person {
        return listPerson[indexPath.row]
    }
    
    
    var heightForRowAt: CGFloat {
        if isListPersonEmpty {
            return 237
        } else {
            return 92
        }
    }
    
    func shouldReturn(textField: UITextField) -> Bool{
        return !(textField.text?.isEmpty ?? false)
    }
    
    func myListImageAndPerson(name: String){
        listPerson.append(Person(name: name, image: listImage.randomElement() ?? ""))
      
    }
    

}
