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
    
    var timer: Timer?
    
    let networkDataFetcher = NetworkDataFetcher()
    var searchResponse: SearchResponse?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        setupElements()
    }
    
    private func setupNavigationBar() {
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
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
        return searchResponse?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewTrackCell.reuseId, for: indexPath) as! TableViewTrackCell
        
        let track = searchResponse?.results[indexPath.row]
        cell.setup(track: track)
        
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
        
        timer?.invalidate() // чтобы таймер начал работать
        
        // логика работы таймера
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkDataFetcher.fetchTracks(searchText: searchText) { [weak self] (result) in
                switch result {
                case .success(let searchResponse):
                    self?.searchResponse = searchResponse
                    self?.tableView.reloadData()

                case .failure(let error):
                    self?.showAlert(title: "Error!", message: "Can't get tracks", completion: {
                        print("Ok boss")
                    })
                    print(error)
                }
            }
        })
    }
}


