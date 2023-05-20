//
//  DetailedViewController.swift
//  EvoGameAppp
//
//  Created by sixpep on 30/03/23.
//

import UIKit

class DetailedViewController: UIViewController {

    let imageScrollView=UIScrollView()
    
    let getApiImage = GetApiImage()
    
    let backButton:UIButton = {
        let button = UIButton()
      //  button.backgroundColor = .white
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
    
    let downloadButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("DOWNLOAD", for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    var tempIosId:String = ""
    
    private let image1:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "Rectangle")
        return imageView
    }()
    
    private let image2:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let image3:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let image4:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let appIcon:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let gameNameLabel:UILabel={
        let label = UILabel()
        //label.backgroundColor = .white
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let developerNameLabel:UILabel={
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
   
    let descriptionText:UITextView={
        let label = UITextView()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.isSelectable = false
        label.isEditable = false
        return label
    }()
    
    private let backgroundImageView:UIImageView={
        let image = UIImageView()
        image.alpha = 0.2
        return image
    }()
    
    private let downloadsView:UIView={
       let view = UIView()
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 3
        return view
    }()

    private let downloadLabel:UILabel={
        let label = UILabel()
        label.text = "Downloads"
        label.textColor = .white
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textAlignment = .center
        return label
    }()
    
    private let downloadDataLabel:UILabel={
        let label = UILabel()
        label.text = "100"
        label.textColor = .white
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 50)
        //label.backgroundColor = .white
        label.textAlignment = .center
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    private let ratingsView:UIView={
        let view = UIView()
         view.layer.borderColor = UIColor.red.cgColor
         view.layer.borderWidth = 3
         return view
    }()
    
    private let ratingLabel:UILabel={
        let label = UILabel()
        label.text = "Rating"
        label.textColor = .white
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textAlignment = .center
        return label
    }()
    
    private let ratingDataLabel:UILabel={
        let label = UILabel()
        label.text = "100"
        label.textColor = .white
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 50)
        //label.backgroundColor = .white
        label.textAlignment = .center
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    private let priceView:UIView={
        let view = UIView()
         view.layer.borderColor = UIColor.red.cgColor
         view.layer.borderWidth = 3
         return view
    }()
    
    private let priceLabel:UILabel={
        let label = UILabel()
        label.text = "Price"
        label.textColor = .white
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textAlignment = .center
        return label
    }()
    
    private let priceDataLabel:UILabel={
        let label = UILabel()
        label.text = "100"
        label.textColor = .white
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 50)
        //label.backgroundColor = .white
        label.textAlignment = .center
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        backgroundImageView.contentMode = .scaleToFill
//        backgroundImageView.frame = view.bounds
        
        backButton.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        imageScrollView.frame = CGRect(x: backButton.frame.minX, y: backButton.frame.maxY, width: view.frame.width*0.3, height: view.frame.height-backButton.frame.maxY)
        
        image1.frame = CGRect(x: 0, y: 0, width: imageScrollView.frame.width, height: view.frame.height/3)
        image2.frame = CGRect(x: 0, y: image1.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        image3.frame = CGRect(x: 0, y: image2.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        image4.frame = CGRect(x: 0, y: image3.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        
        appIcon.frame = CGRect(x: imageScrollView.frame.width+50, y: imageScrollView.frame.minY, width: view.frame.width*0.1, height: view.frame.width*0.1)
        appIcon.layer.cornerRadius = 10
        
        gameNameLabel.frame = CGRect(x: appIcon.frame.maxX+5, y: appIcon.frame.minY, width: (view.frame.width-imageScrollView.frame.maxX-appIcon.frame.width)/2, height: appIcon.frame.height*0.45)
        
        downloadButton.frame = CGRect(x: gameNameLabel.frame.maxX+25, y: gameNameLabel.frame.minY, width: view.frame.width/5, height: gameNameLabel.frame.height)
        
        
        developerNameLabel.frame = CGRect(x: appIcon.frame.maxX+5, y: gameNameLabel.frame.maxY, width: view.frame.width-appIcon.frame.maxX, height: appIcon.frame.height*0.35)
        
        let appIconWidth = appIcon.frame.width
        let appIconHeight = appIcon.frame.height
        
        
        
        downloadsView.frame = CGRect(x: appIcon.frame.minX, y: appIcon.frame.maxY+10, width: (appIconWidth)*0.9, height: appIconHeight*0.9)
        
        downloadLabel.frame = CGRect(x: downloadsView.frame.minX, y: downloadsView.frame.maxY+10, width: downloadsView.frame.width, height: 20)
        
        let frameYPosition = (downloadsView.frame.height-downloadsView.frame.height*0.4)/2
        
        downloadDataLabel.frame = CGRect(x: 0, y: frameYPosition, width: downloadsView.frame.width, height: downloadsView.frame.height*0.4)
        
        let ratingsViewX = (view.frame.width-downloadsView.frame.maxX)/2-downloadsView.frame.width+downloadsView.frame.maxX
        
        ratingsView.frame = CGRect(x: ratingsViewX, y: appIcon.frame.maxY+10, width: (appIconWidth)*0.9, height: appIconHeight*0.9)
        
        ratingDataLabel.frame = CGRect(x: 0, y: frameYPosition, width: downloadsView.frame.width, height: downloadsView.frame.height*0.4)
        
        ratingLabel.frame = CGRect(x: ratingsView.frame.minX, y: ratingsView.frame.maxY+10, width: ratingsView.frame.width, height: 20)

        let priceViewXPoint = (view.frame.width-ratingsView.frame.maxX)-ratingsView.frame.width+ratingsView.frame.maxX
        
        priceView.frame = CGRect(x: priceViewXPoint, y: appIcon.frame.maxY+10, width: (appIconWidth)*0.9, height: appIconHeight*0.9)

        priceLabel.frame = CGRect(x: priceView.frame.minX, y: priceView.frame.maxY+10, width: priceView.frame.width, height: 20)
        
        priceDataLabel.frame = CGRect(x: 0, y: frameYPosition, width: downloadsView.frame.width, height: downloadsView.frame.height*0.4)
        
        //downloadsView.backgroundColor = .systemRed
        
        descriptionText.frame = CGRect(x: appIcon.frame.minX, y: priceLabel.frame.maxY + 10, width: view.frame.width - appIcon.frame.minX - 20, height: view.frame.height - (priceLabel.frame.maxY + 10) - 20)

        
        imageScrollView.backgroundColor = .clear
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(backButton)
        view.addSubview(imageScrollView)

        
        imageScrollView.addSubview(image1)
        imageScrollView.addSubview(image2)
        imageScrollView.addSubview(image3)
        imageScrollView.addSubview(image4)
        
        view.addSubview(appIcon)
        view.addSubview(gameNameLabel)
        view.addSubview(downloadButton)
        view.addSubview(developerNameLabel)
        view.addSubview(downloadsView)
        view.addSubview(downloadLabel)
        view.addSubview(ratingsView)
        view.addSubview(ratingLabel)
        view.addSubview(priceView)
        view.addSubview(priceLabel)
        
        downloadsView.addSubview(downloadDataLabel)
        ratingsView.addSubview(ratingDataLabel)
        priceView.addSubview(priceDataLabel)
    
        
        view.addSubview(descriptionText)
        
        imageScrollView.contentSize = CGSize(width: imageScrollView.frame.width, height: image4.frame.maxY)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
    @objc func downloadButtonTapped(){
        //IosId
        if let appStoreURL = URL(string: "https://apps.apple.com/app/\(tempIosId)") {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
            print(appStoreURL)
        }
        
    }
    
    func setBackG(CoverImage: String,Screenshot1:String,Screenshot2:String,Screenshot3:String,Screenshot4:String,Icon:String,gameName:String,devName:String,description:String,IosId:String,downloadsData:String,ratingsData:String,priceData:String){
        getApiImage.setBackG(urlString: CoverImage){image in
            DispatchQueue.main.async {
                self.backgroundImageView.image = image
                        }
        }
        getApiImage.setBackG(urlString: Screenshot1){image in
            DispatchQueue.main.async {
                self.image1.image = image
                        }
        }
        getApiImage.setBackG(urlString: Screenshot2){image in
            DispatchQueue.main.async {
                self.image2.image = image
                        }
        }
        getApiImage.setBackG(urlString: Screenshot3){image in
            DispatchQueue.main.async {
                self.image3.image = image
                        }
        }
        getApiImage.setBackG(urlString: Screenshot4){image in
            DispatchQueue.main.async {
                self.image4.image = image
                        }
        }
        getApiImage.setBackG(urlString: Icon){image in
            DispatchQueue.main.async {
                self.appIcon.image = image
                        }
        }
        
        tempIosId = IosId
        gameNameLabel.text = gameName
        developerNameLabel.text = devName
        
        downloadDataLabel.text = downloadsData
        ratingDataLabel.text = ratingsData
        
        if priceData == "0"{
            priceDataLabel.text = "Free"
        }else{
            priceDataLabel.text = "₹\(priceData)"
        }
        
        
        
        descriptionText.text = convertHTMLToPlainText(htmlText: description)

    }
    
    func convertHTMLToPlainText(htmlText: String) -> String? {
        guard let data = htmlText.data(using: .utf8) else {
            return nil
        }
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            return attributedString.string
        } else {
            return nil
        }
    }
    
}


