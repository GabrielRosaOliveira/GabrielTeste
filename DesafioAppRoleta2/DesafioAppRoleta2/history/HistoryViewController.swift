//
//  HistoryViewController.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 08/12/22.
//

import UIKit

class HistoryViewController: UIViewController {

    let viewModel: HistoryViewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHistory()
        
    }
    



}
