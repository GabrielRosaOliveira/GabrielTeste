//
//  HistoryService.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 11/12/22.
//

import UIKit

protocol HistoryServiceProtocol: GenericService {
    func getHistoryFromJson(completion: completion<History?>)
}

class HistoryService: HistoryServiceProtocol {
    
    
    
    
    func getHistoryFromJson(completion: completion<History?>) {
        if let url = Bundle.main.url(forResource: "History", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let history: History = try JSONDecoder().decode(History.self, from: data)
                //  completion(history(caso de sucesso),nil(Erro))
                completion(history,nil)
            } catch  {
                completion(nil, error)
            }
        }
    }
}


// Exemplo de Arquitetura MVVM

// Tela Home

//HomeViewController.storyboard ou HomeViewController.xib ou HomeScreen(ViewCode)
// HomeViewController
// HomeViewModel
// HomeService -> OBS: Caso seja necessario -> Essa classe deve conter (HomeServiceProtocol -> OBS: Depende da Arquitetura)

