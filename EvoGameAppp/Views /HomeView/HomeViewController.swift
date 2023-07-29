//
//  HomeViewController.swift
//  EvoGameAppp
//
//  Created by sixpep on 22/03/23.
//

import UIKit
import GameController

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
//        button.backgroundColor = .white
        button.setImage(UIImage(named: "EvoButton"), for: .normal)
        button.contentMode = .scaleAspectFit
//        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let searchButton:UIButton = {
        let button = UIButton()
//        button.backgroundColor = .white
        button.setImage(UIImage(named: "SearchButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()
    
    let giftButton:UIButton = {
        let button = UIButton()
//        button.backgroundColor = .white
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
    
    let controllerConnectedImageView:UIImageView={
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.contentMode = .scaleToFill
        return image
    }()
    
    let internetConnectionImageView:UIImageView={
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.contentMode = .scaleToFill
        return image
    }()
    
    let batteryImageView:UIImageView={
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    let batteryPerLabel:UILabel={
       let label = UILabel()
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let timeLabel:UILabel={
        let label = UILabel()
         label.numberOfLines = 1 // Display text in a single line
         label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
//         label.minimumScaleFactor = 0.5
         label.textColor = .white
         label.font = UIFont.boldSystemFont(ofSize: 30)
         return label
    }()
    
    let topBarValue = TopBarViewFile()
    
    let topBarView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        recommendedCollectionView.collectionViewLayout = flowLayout
        featuredCollectionView.collectionViewLayout = flowLayout
        categoriesCollectionView.collectionViewLayout = flowLayout
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        evoButton.addTarget(self, action: #selector(evoButtonTapped), for: .touchUpInside)
        
        recommendedCollectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: RecommendedCell.indentifier)
        
        featuredCollectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.indentifier)
        
        categoriesCollectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.indentifier)
        // Do any additional setup after loading the view.
        
        recommendedCollectionView.dataSource = self
        recommendedCollectionView.delegate = self
        
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        
        
        fetchCategoriesData()
        fetchFeaturedData()
        fetchRecommendedData()
        
        self.navigationItem.hidesBackButton = true
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
        
        
        topBarView.frame = CGRect(x: view.frame.midX+view.frame.midX/2-30, y: 20, width: view.frame.width/4, height: view.frame.height*0.1)
        
        let topBarViewWidth = topBarView.frame.width
        let topBarViewheight = topBarView.frame.height
        
        let topBarImageViewWidth = (topBarViewWidth/5)/2
       // let topBarImageViewHeight = topBarViewheight/1.5
        
        controllerConnectedImageView.frame = CGRect(x: 0, y: 0, width: topBarImageViewWidth, height: topBarImageViewWidth)
        
        internetConnectionImageView.frame = CGRect(x: controllerConnectedImageView.frame.width+10, y: 0, width: topBarImageViewWidth, height: topBarImageViewWidth)
        
        batteryImageView.frame = CGRect(x: internetConnectionImageView.frame.maxX+10, y: 0, width: topBarImageViewWidth, height: topBarImageViewWidth)
        
        batteryPerLabel.frame = CGRect(x: batteryImageView.frame.maxX+10, y: 0, width: topBarImageViewWidth*1.7, height: topBarImageViewWidth)
        
        timeLabel.frame = CGRect(x: batteryPerLabel.frame.maxX+10, y: controllerConnectedImageView.frame.minY, width: topBarImageViewWidth*2.2, height: topBarImageViewWidth)
        
        
        
        //topBarValue
        
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
        
        view.addSubview(topBarView)
        topBarView.addSubview(controllerConnectedImageView)
        topBarView.addSubview(internetConnectionImageView)
        topBarView.addSubview(batteryImageView)
        topBarView.addSubview(batteryPerLabel)
        topBarView.addSubview(timeLabel)
        
        if allRecommended.isEmpty{
            fetchCategoriesData()
            fetchFeaturedData()
            fetchRecommendedData()
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controllerConnectedImageView.image = topBarValue.getConsollerStatus()
        internetConnectionImageView.image = topBarValue.getNetworkConnectivityType()
        batteryImageView.image = topBarValue.getBatteryImage()
        batteryPerLabel.text = topBarValue.getBatteryPercentage()
        timeLabel.text = topBarValue.getTime()
        
        
    }
    
    @objc func searchButtonTapped(){
//        let vc = NewSearchViewController()
//        navigationController?.pushViewController(vc, animated: false)
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NewSearchViewController") as? NewSearchViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @objc func evoButtonTapped(){
        
        print("EvoButton Tapped")
//        let vc = EvoAboutViewController()
//        navigationController?.pushViewController(vc, animated: false)
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "EvoAboutViewController") as? EvoAboutViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    
//    func getBattery()->String{
//        UIDevice.current.isBatteryMonitoringEnabled = true
//        let level = Int(abs(UIDevice.current.batteryLevel))
//        return String(level*100)
//    }
    
    
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
        guard let url = URL(string: "https://privapi.amkette.com/egpapp_v3/iosapi/featured.php")
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

