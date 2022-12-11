//
//  HistoryService.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 11/12/22.
//

import UIKit

protocol HistoryServiceProtocol: GenericService {
    func getHistoryFromJson(completion: @escaping completion<History?>)
}

class HistoryService: HistoryServiceProtocol {
    
    func getHistoryFromJson(completion: @escaping completion<History?>) {
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
