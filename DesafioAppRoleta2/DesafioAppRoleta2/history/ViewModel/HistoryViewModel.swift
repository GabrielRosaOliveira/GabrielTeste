//
//  HistoryViewModel.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 11/12/22.
//

import UIKit

protocol HistoryViewModelProtocol: AnyObject {
    func success()
    func error(detail: String)
}

class HistoryViewModel {

    private let service: HistoryService = HistoryService()
    private var history: History?
    weak private var delegate: HistoryViewModelProtocol?
    
    func delegate(delegate: HistoryViewModelProtocol?) {
        self.delegate = delegate
    }
    
    var numberOfRows: Int {
        history?.historyAccountList?.count ?? 0
    }
    
    var heightForRowAt: CGFloat {
        return 273
    }
    
    func loadCurrentHistory(indexPath: IndexPath) -> HistoryAccountList{
        return history?.historyAccountList?[indexPath.row] ?? HistoryAccountList()
    }
    
    func fetchHistory() {
        service.getHistoryAlamofire { result, faiLure in
            if let result = result {
                self.history = result
                self.delegate?.success()
                print(result)
            } else {
                print("deu ruim")
                self.delegate?.error(detail: faiLure?.localizedDescription ?? "")
            }
        }
    }
}
