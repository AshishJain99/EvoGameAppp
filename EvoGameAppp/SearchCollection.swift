//
//  SearchCollection.swift
//  EvoGameAppp
//
//  Created by sixpep on 01/04/23.
//

import Foundation
import UIKit

class SearchCollection:UIViewController{
    
    var allSearchCollection:[search]=[]
    
    let searchController = UISearchController()
    
    let SearchCategoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let backButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "leftArrowButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let backButtonImage:UIImage={
        let image = UIImage(named:"leftArrowButton")
        return image!
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        navigationItem.hidesBackButton = true

        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        SearchCategoryCollectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.indentifier)
        
    //    navigationController?.setNavigationBarHidden(true, animated: false)
        //view.backgroundColor = .systemPink
        
        SearchCategoryCollectionView.dataSource = self
        SearchCategoryCollectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backButton.frame = CGRect(x: view.frame.width/2, y: view.frame.height/2, width: 50, height: 50)
        
        SearchCategoryCollectionView.frame = CGRect(x: backButton.frame.minX, y: backButton.frame.maxY, width: view.frame.width-backButton.frame.width-40, height: view.frame.height-backButton.frame.height-30)
        SearchCategoryCollectionView.backgroundColor = .clear
        view.addSubview(SearchCategoryCollectionView)
        
        view.addSubview(backButton)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
}

extension SearchCollection:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSearchCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SearchCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.indentifier, for: indexPath) as? CategoryCollectionCell
        let AppName = allSearchCollection[indexPath.row].AppName!
        let imageURL = allSearchCollection[indexPath.row].CoverImage!
        cell!.recommendedGetImage(urlString: imageURL)
        cell!.CategoryTextLabel.text = AppName
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailedViewController()
        let data = allSearchCollection[indexPath.row]
        detailVC.setBackG(CoverImage: data.CoverImage!, Screenshot1: data.Screenshot1!, Screenshot2: data.Screenshot2!, Screenshot3: data.Screenshot3!, Screenshot4: data.Screenshot4!,Icon: data.Icon!,gameName: data.AppName!,devName: data.Author!,description: data.Description!)
                navigationController?.pushViewController(detailVC, animated: false)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/4 ), height: (collectionView.frame.height/2.5))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func getCategoryData(Type:String){
        let urlWithType = "https://privapi.amkette.com/egpapp_v3/category.php?device=1&category=\(Type)"
        guard let url = URL(string: urlWithType)
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in

            if error == nil{
                if data != nil{
                    DispatchQueue.main.async {
                        do{
                            let ApiResponse = try JSONDecoder().decode(searchApiResponse.self, from: data!)
                            print(ApiResponse)
                            self.allSearchCollection.append(contentsOf: ApiResponse.Search!)

                            self.SearchCategoryCollectionView.reloadData()
                            //print(ApiResponse)
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
