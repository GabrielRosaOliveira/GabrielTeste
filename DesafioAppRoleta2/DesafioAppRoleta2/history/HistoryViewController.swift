//
//  HistoryViewController.swift
//  DesafioAppRoleta2
//
//  Created by Gabriel on 08/12/22.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: HistoryViewModel = HistoryViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchHistory()
        
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryTableViewCell.nib(), forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.reloadData()
    }

}

extension HistoryViewController: UITableViewDelegate {
    
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentHistory(indexPath: indexPath) )
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRowAt
    }
    
}

extension HistoryViewController: HistoryViewModelProtocol {
    func success() {
        configTableView()
    }
    
    func error(detail: String) {
        print(detail)
    }
    
    
    
    
}
