//
//  HistoryService.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 11/12/22.
//

import UIKit

protocol HistoryServiceProtocol: GenericService {
    func getHistoryFromJson(completion: completion<History?>)
    func getHistoryURLSession(completion: @escaping completion<History?>)
}

class HistoryService: HistoryServiceProtocol {
    
    func getHistoryURLSession(completion: @escaping completion<History?>) {
        
        let urlString: String = "https://run.mocky.io/v3/2a1ddc4d-be1b-4202-853a-391c8585464d"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //         esta tirando a opcionalidade do data
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let history: History = try JSONDecoder().decode(History.self, from: dataResult)
                    print("Sucess -> \(#function)")
                    //  completion(history(caso de sucesso),nil(Erro))
                    completion(history,nil)
                } catch  {
                    print("Error -> \(#function)")
                    completion(nil, error)
                }
            } else {
                print("Error -> \(#function)")
                print("deu ruim")
            }
        }
        task.resume()
    }
    
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

