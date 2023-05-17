//
//  NewSearchViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 11/05/23.
//

import UIKit

class NewSearchViewController: UIViewController, UISearchBarDelegate{

    
    
    lazy var searchDetailedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.indentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
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
    
    var allSearch:[Search] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.hidesBackButton = true
        
        searchDetailedCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.indentifier)

        searchDetailedCollectionView.delegate = self
        searchDetailedCollectionView.dataSource = self
        
        // Set up the back button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        // Set up the custom view
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .clear
        searchBar.backgroundColor = .clear
        view.addSubview(customView)
        
        searchDetailedCollectionView.frame = CGRect(x: 0, y: backButton.frame.height, width: view.frame.width, height: view.frame.height - backButton.frame.height)
        searchDetailedCollectionView.backgroundColor = .clear
        customView.addSubview(searchBar)
        view.addSubview(searchDetailedCollectionView)
        
        // Set up the search bar
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        
        
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
            searchBar.bottomAnchor.constraint(equalTo: customView.bottomAnchor),

            searchDetailedCollectionView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 10),
            searchDetailedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchDetailedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchDetailedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])



        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .white
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               // view.addGestureRecognizer(tapGesture)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)

        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchDetailedCollectionView.frame = CGRect(x: 0, y: customView.frame.maxY + 10, width: view.frame.width, height: view.frame.height - customView.frame.maxY - 10)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Get the updated text from the search bar
        let enteredText = searchBar.text ?? ""
        fetchSearchData(text: enteredText)
        //print("Entered text: \(enteredText)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Perform search functionality here
        print("Search button clicked")
        searchBar.resignFirstResponder() // Dismiss the keyboard
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
        print("Back Button tapped")
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        //searchBar.resignFirstResponder()
        
    }
    
    private func fetchSearchData(text:String){
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/search.php?search=\(text)")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil{
                if data != nil{
                    DispatchQueue.main.async {
                        do{
                            let ApiResponse = try JSONDecoder().decode(searchResponseApi.self, from: data!)
                            self.allSearch.append(contentsOf: ApiResponse.Search!)
                            
                            DispatchQueue.main.async {
                                self.searchDetailedCollectionView.reloadData()
                                //print(apiResponse)
                            }
                        }
                        
                        catch{
                            print("Model Problem")
                        }
                    }
                }
                
            }
            else{
                print("Parsing problem")
            }
            
        }.resume()
    }
    
    
}

extension NewSearchViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchDetailedCollectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.indentifier, for: indexPath) as? SearchCollectionViewCell
        let AppName = allSearch[indexPath.row].AppName
        let imageURL = allSearch[indexPath.row].CoverImage!
        cell!.recommendedGetImage(urlString: imageURL)
        cell!.searchTextLabel.text = AppName
        cell!.isUserInteractionEnabled = true
        return cell!
    }
//
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print(indexPath)
                let detailVC = DetailedViewController()
                let data = allSearch[indexPath.row]
                detailVC.setBackG(
                    CoverImage: data.CoverImage!,
                    Screenshot1: data.Screenshot1!,
                    Screenshot2: data.Screenshot2!,
                    Screenshot3: data.Screenshot3!,
                    Screenshot4: data.Screenshot4!,
                    Icon: data.Icon!,
                    gameName: data.AppName!,
                    devName: data.Author!,
                    description: data.Description!
                )
                navigationController?.pushViewController(detailVC, animated: false)
            }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = collectionView.bounds.width / 2 - 15 // Adjust the cell width and spacing as desired
//        let cellHeight: CGFloat = 200 // Adjust the cell height as desired
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        // Return the desired interitem spacing
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        // Return the desired line spacing
//        return 10
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let spacing: CGFloat = 10 // Adjust the spacing between cells as desired
            let width = (collectionView.bounds.width - spacing * 3) / 2 // Adjust the number of items per row and spacing as desired
            let height: CGFloat = 200 // Adjust the cell height as desired
            return CGSize(width: width, height: height)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacing: CGFloat = 10 // Adjust the spacing between cells as desired
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let spacing: CGFloat = 10 // Adjust the spacing between cells as desired
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let spacing: CGFloat = 10 // Adjust the spacing between cells as desired
        return spacing
    }
    
    
}

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let spacing: CGFloat = 10 // Adjust the spacing between cells as desired
        let width = (collectionView.bounds.width - spacing * 3) / 2 // Adjust the number of items per row and spacing as desired
        let height: CGFloat = 200 // Adjust the cell height as desired
        itemSize = CGSize(width: width, height: height)
        sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        minimumLineSpacing = spacing
        minimumInteritemSpacing = spacing
    }
}
