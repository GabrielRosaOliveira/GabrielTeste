//
//  HistoryViewModel.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 11/12/22.
//

import UIKit

class HistoryViewModel {

    private let service: HistoryService = HistoryService()
    
    func fetchHistory() {
        service.getHistoryFromJson { result, faiLure in
            if let result = result {
                print(result)
            } else {
                print("deu ruim")
            }
        }
    }
    
    
}
