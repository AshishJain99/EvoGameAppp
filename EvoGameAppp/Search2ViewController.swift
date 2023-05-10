//
//  Search2ViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 09/05/23.
//

import UIKit

class Search2ViewController: UIViewController, UISearchBarDelegate{

        let searchBar = UISearchBar()
        let button = UIButton(type: .system)
        let cancelButton = UIButton(type: .system)

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set up the search bar
            searchBar.delegate = self
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(searchBar)
            
            // Set up the button
            button.setTitle("Button", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            
            // Set up the cancel button
            cancelButton.setTitle("Cancel", for: .normal)
            cancelButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(cancelButton)
            
            // Set up constraints
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                button.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                cancelButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
                cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
        
        // MARK: - UISearchBarDelegate
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // Perform search functionality here
            print("Search button clicked")
        }
        
        // MARK: - Button Actions
        
        @objc func buttonTapped() {
            // Button action here
            print("Button tapped")
        }
        
        @objc func cancelButtonTapped() {
            // Cancel button action here
            print("Cancel button tapped")
        
    }
}
