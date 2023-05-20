//
//  HomeViewController.swift
//  EvoGameAppp
//
//  Created by sixpep on 22/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var allRecommended:[Recommended] = []
    var allFeatured:[Featured] = []
    var allCategories: [String] = []
    
    
    
    
    let reccomendedLabel:UILabel={
        let label = UILabel()
        label.text = "RECOMMENDED"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let featuredLabel:UILabel={
        let label = UILabel()
        label.text = "FEATURED"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let categoriesLabel:UILabel={
        let label = UILabel()
        label.text = "CATEGORIES"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    
    let scrollView = UIScrollView()
    
    
    let recommendedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let featuredCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    let evoButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setImage(UIImage(named: "EvoButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let searchButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "SearchButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let giftButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "GiftButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let backgroundImageView:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "BackG")
        
        return image
    }()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    var data = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        recommendedCollectionView.collectionViewLayout = flowLayout
        featuredCollectionView.collectionViewLayout = flowLayout
        categoriesCollectionView.collectionViewLayout = flowLayout
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        recommendedCollectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: RecommendedCell.indentifier)
        
        featuredCollectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.indentifier)
        
        categoriesCollectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.indentifier)
        // Do any additional setup after loading the view.
        
        print(getTime())
        print(getBattery())
        recommendedCollectionView.dataSource = self
        recommendedCollectionView.delegate = self
        
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        
        
        fetchCategoriesData()
        fetchFeaturedData()
        fetchRecommendedData()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let buttonWidth = view.frame.width * 0.05
        
        
        evoButton.frame = CGRect(x: 20, y: 20, width: buttonWidth, height: buttonWidth)
        evoButton.layer.cornerRadius = buttonWidth / 2
        searchButton.frame = CGRect(x: evoButton.frame.maxX + 20, y: 20, width: buttonWidth, height: buttonWidth)
        searchButton.layer.cornerRadius = buttonWidth / 2
        giftButton.frame = CGRect(x: searchButton.frame.maxX + 20, y: 20, width: buttonWidth, height: buttonWidth)
        giftButton.layer.cornerRadius = buttonWidth / 2
        
        scrollView.frame = CGRect(x: 20, y: evoButton.frame.maxY+10, width: view.frame.width-20, height: view.frame.height-(evoButton.frame.maxY+10))
        
        reccomendedLabel.frame = CGRect(x: 40, y: 0, width: scrollView.frame.width, height: view.frame.height*0.1)
        
        recommendedCollectionView.frame = CGRect(x: 20, y: reccomendedLabel.frame.maxY+20, width: scrollView.frame.width-20, height: (view.frame.height-(evoButton.frame.maxY+10))/3.3)
        
        featuredLabel.frame = CGRect(x: 40, y: recommendedCollectionView.frame.maxY+20, width: scrollView.frame.width, height: view.frame.height*0.1)
        
        featuredCollectionView.frame = CGRect(x: 20, y: featuredLabel.frame.maxY+20, width: scrollView.frame.width-20, height: (view.frame.height-(evoButton.frame.maxY+10))/3.3)
        
        categoriesLabel.frame = CGRect(x: 40, y: featuredCollectionView.frame.maxY+20, width: scrollView.frame.width, height: view.frame.height*0.1)
        
        categoriesCollectionView.frame = CGRect(x: 20, y: categoriesLabel.frame.maxY+20, width: scrollView.frame.width-20, height: (view.frame.height-(evoButton.frame.maxY+10))/3.3)
        
        
        //scrollView.backgroundColor = .red
        recommendedCollectionView.backgroundColor = .clear
        featuredCollectionView.backgroundColor = .clear
        categoriesCollectionView.backgroundColor = .clear
        
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.frame = view.bounds
        
        view.addSubview(scrollView)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(evoButton)
        view.addSubview(searchButton)
        view.addSubview(giftButton)
        
        scrollView.addSubview(reccomendedLabel)
        scrollView.addSubview(recommendedCollectionView)
        scrollView.addSubview(featuredLabel)
        scrollView.addSubview(featuredCollectionView)
        scrollView.addSubview(categoriesLabel)
        scrollView.addSubview(categoriesCollectionView)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: categoriesCollectionView.frame.maxY)
    }
    
    @objc func searchButtonTapped(){
        let vc = NewSearchViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func getTime()->String{
        let today = Date()
        var hours = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        var AM = "AM"
        
        if hours>=12{
            hours = hours%12
            AM = "PM"
        }
        
        return "\(hours):\(minutes)\(AM)"
    }
    
    func getBattery()->String{
        UIDevice.current.isBatteryMonitoringEnabled = true
        let level = Int(abs(UIDevice.current.batteryLevel))
        return String(level*100)
    }
    
    
}

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == recommendedCollectionView{
            let detailVC = DetailedViewController()
            let data = allRecommended[indexPath.row]
            detailVC.setBackG(CoverImage: data.CoverImage!, Screenshot1: data.Screenshot1!, Screenshot2: data.Screenshot2!, Screenshot3: data.Screenshot3!, Screenshot4: data.Screenshot4!,Icon: data.Icon!,gameName: data.AppName!,devName: data.Author!,description: data.Description!, IosId: data.IosID ?? "xx",downloadsData: data.IosInstallCount ?? "N/A",ratingsData: data.IosRatings ?? "N/A",priceData: data.IosINR ?? "Free")
                    navigationController?.pushViewController(detailVC, animated: false)
        }else if collectionView == featuredCollectionView{
            let detailVC = DetailedViewController()
            let data = allFeatured[indexPath.row]
            detailVC.setBackG(CoverImage: data.CoverImage!, Screenshot1: data.Screenshot1!, Screenshot2: data.Screenshot2!, Screenshot3: data.Screenshot3!, Screenshot4: data.Screenshot4!,Icon: data.Icon!,gameName: data.AppName!,devName: data.Author!,description: data.Description!, IosId: data.IosID ?? "xx",downloadsData: data.IosInstallCount ?? "N/A",ratingsData: data.IosRatings ?? "N/A",priceData: data.IosINR ?? "Free")
                    navigationController?.pushViewController(detailVC, animated: false)
        }else if collectionView == categoriesCollectionView{
            let VC = CategoryCollectionView()
            let data = allCategories[indexPath.row]
            VC.getCategoryData(Type: data)
            print(data)
                    navigationController?.pushViewController(VC, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == recommendedCollectionView{
            print("allRecommended\(allRecommended.count)")
            return allRecommended.count
        }else if collectionView == featuredCollectionView{
            print("featuredModel\(allFeatured.count)")
            return allFeatured.count
        }else if collectionView == categoriesCollectionView{
            print("allCategories\(allCategories.count)")
            return allCategories.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case recommendedCollectionView:
           guard let cell = recommendedCollectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCell.indentifier, for: indexPath) as? RecommendedCell else{
               return UICollectionViewCell()
           }
            let AppName = allRecommended[indexPath.row].AppName
            let imageURL = allRecommended[indexPath.row].CoverImage!
            cell.recommendedGetImage(urlString: imageURL)
            cell.recommendedTextLabel.text = AppName
            return cell
        case featuredCollectionView:
            guard let cell = featuredCollectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.indentifier, for: indexPath) as? FeaturedCell else{
                return UICollectionViewCell()
            }
            let AppName = allFeatured[indexPath.row].AppName!
            let imageURL = allFeatured[indexPath.row].CoverImage!
            cell.getImage(urlString: imageURL)
            cell.getAppName(AppName: AppName)
            return cell
        case categoriesCollectionView:
            guard let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.indentifier, for: indexPath) as? CategoriesCell else {
                return UICollectionViewCell()
            }
            let category = allCategories[indexPath.item]
            cell.text.text = category
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/4 ), height: (collectionView.frame.height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

struct Model{
    let text:String
    let imageName:String
    
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
    
    
}
extension HomeViewController{
    
    private func fetchCategoriesData(){
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/list_category.php") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil{
                if data != nil{
                    DispatchQueue.main.async {
                        do{
                            let CategoryResponse = try JSONDecoder().decode(Welcome.self, from: data!)
                        //    print(CategoryResponse)
                            //self.allCategories.append(contentsOf: CategoryResponse)
                            self.allCategories = CategoryResponse
                            self.categoriesCollectionView.reloadData()
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
    
    
    private func fetchFeaturedData(){
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/featured.php?device=1")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil{
                if data != nil{
                    DispatchQueue.main.async {
                        do{
                            let ApiResponse = try JSONDecoder().decode(featuredApiResponse.self, from: data!)
                            self.allFeatured.append(contentsOf: ApiResponse.Featured!)
                            
                        //    print(self.allFeatured.count)
                            self.featuredCollectionView.reloadData()
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
    
    private func fetchRecommendedData(){
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/recomended.php")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil{
                if data != nil{
                    DispatchQueue.main.async {
                        do{
                            let ApiResponse = try JSONDecoder().decode(RecommendedApiResponse.self, from: data!)
                            self.allRecommended.append(contentsOf: ApiResponse.Recommended!)
                            
                            self.recommendedCollectionView.reloadData()
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
