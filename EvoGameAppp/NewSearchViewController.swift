//
//  NewSearchViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 11/05/23.
//

import UIKit

class NewSearchViewController: UIViewController, UISearchBarDelegate {
    let customView = UIView()
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "leftArrowButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        // Set up the back button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        // Set up the custom view
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .clear
        searchBar.backgroundColor = .clear
        view.addSubview(customView)
        
        // Set up the search bar
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        customView.addSubview(searchBar)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            customView.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            customView.heightAnchor.constraint(equalToConstant: 50),
            
            searchBar.topAnchor.constraint(equalTo: customView.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: customView.bottomAnchor)
        ])
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
                    textField.textColor = .white
                }
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Perform search functionality here
        print("Search button clicked")
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
        print("Back Button tapped")
    }
}
