//
//  SearchViewController.swift
//  BorisTestApp
//
//  Created by Пархоменко Алексей on 23.10.2020.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let tableView = UITableView()
    
    let array = [1,4,6,8,9,5]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white

        setupNavigationBar()
        setupElements()
    }
    
    private func setupNavigationBar() {
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    private func setupElements() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewTrackCell.self, forCellReuseIdentifier: TableViewTrackCell.reuseId)
        
        tableView.tableFooterView = UIView()
        
        ///// - 1 способ
        // 1
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // 2
        view.addSubview(tableView)
        // 3 constraints
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewTrackCell.reuseId, for: indexPath) as! TableViewTrackCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}


// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}

