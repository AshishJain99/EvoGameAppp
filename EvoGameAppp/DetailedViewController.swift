//
//  DetailedViewController.swift
//  EvoGameAppp
//
//  Created by sixpep on 30/03/23.
//

import UIKit

class DetailedViewController: UIViewController {
    
    let imageScrollView=UIScrollView()
    
    let mainScreenScrollView=UIScrollView()
    
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
        label.text = "Age Rating"
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
        
        let buttonWidth = view.frame.width * 0.05
        
        backButton.frame = CGRect(x: 20, y: 20, width: buttonWidth, height: buttonWidth)
        imageScrollView.frame = CGRect(x: backButton.frame.minX, y: backButton.frame.maxY+5, width: view.frame.width*0.3, height: view.frame.height-backButton.frame.maxY)
        
        mainScreenScrollView.frame = CGRect(x: imageScrollView.frame.maxX, y: backButton.frame.maxY+5, width: (view.frame.width*0.7)-20, height: view.frame.height-backButton.frame.maxY)
        
        mainScreenScrollView.backgroundColor = .black
        mainScreenScrollView.showsVerticalScrollIndicator = false
        
        image1.frame = CGRect(x: 0, y: 0, width: imageScrollView.frame.width, height: view.frame.height/3)
        image2.frame = CGRect(x: 0, y: image1.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        image3.frame = CGRect(x: 0, y: image2.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        image4.frame = CGRect(x: 0, y: image3.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        
        appIcon.frame = CGRect(x: 5, y: 0, width: view.frame.width*0.1, height: view.frame.width*0.1)
        appIcon.layer.cornerRadius = 10
        
        gameNameLabel.frame = CGRect(x: appIcon.frame.maxX+5, y: appIcon.frame.minY, width: (view.frame.width-imageScrollView.frame.maxX-appIcon.frame.width)/2, height: appIcon.frame.height*0.45)
        
        downloadButton.frame = CGRect(x: mainScreenScrollView.frame.width-(view.frame.width/6)-10, y: gameNameLabel.frame.minY+5, width: view.frame.width/6, height: gameNameLabel.frame.height)
        
        
        developerNameLabel.frame = CGRect(x: appIcon.frame.maxX+5, y: gameNameLabel.frame.maxY, width: view.frame.width-appIcon.frame.maxX, height: appIcon.frame.height*0.35)
        
        let appIconWidth = appIcon.frame.width
        let appIconHeight = appIcon.frame.height
        
        
        
        downloadsView.frame = CGRect(x: appIcon.frame.minX, y: appIcon.frame.maxY+10, width: (appIconWidth)*0.9, height: appIconHeight*0.9)
        
        downloadLabel.frame = CGRect(x: downloadsView.frame.minX, y: downloadsView.frame.maxY+10, width: downloadsView.frame.width, height: 20)
        
        let frameYPosition = (downloadsView.frame.height-downloadsView.frame.height*0.4)/2
        
        downloadDataLabel.frame = CGRect(x: 0, y: frameYPosition, width: downloadsView.frame.width, height: downloadsView.frame.height*0.4)
        
//        let ratingsViewX = (view.frame.width-downloadsView.frame.maxX)/2-downloadsView.frame.width+downloadsView.frame.maxX
        
        let ratingsViewX = (mainScreenScrollView.frame.width-downloadsView.frame.width)/2
        
        ratingsView.frame = CGRect(x: ratingsViewX, y: appIcon.frame.maxY+10, width: (appIconWidth)*0.9, height: appIconHeight*0.9)
        
        ratingDataLabel.frame = CGRect(x: 0, y: frameYPosition, width: downloadsView.frame.width, height: downloadsView.frame.height*0.4)
        
        ratingLabel.frame = CGRect(x: ratingsView.frame.minX, y: ratingsView.frame.maxY+10, width: ratingsView.frame.width, height: 20)
        
//        let priceViewXPoint = (mainScreenScrollView.frame.width-ratingsView.frame.maxX)-ratingsView.frame.width+ratingsView.frame.maxX
        
        let priceViewXPoint = mainScreenScrollView.frame.width-ratingsView.frame.width
        
        priceView.frame = CGRect(x: priceViewXPoint, y: appIcon.frame.maxY+10, width: (appIconWidth)*0.9, height: appIconHeight*0.9)
        
        priceLabel.frame = CGRect(x: priceView.frame.minX, y: priceView.frame.maxY+10, width: priceView.frame.width, height: 20)
        
        priceDataLabel.frame = CGRect(x: 0, y: frameYPosition, width: downloadsView.frame.width, height: downloadsView.frame.height*0.4)
        
        //downloadsView.backgroundColor = .systemRed
        
        descriptionText.frame = CGRect(x: 5, y: priceLabel.frame.maxY + 10, width: mainScreenScrollView.frame.width-10, height: view.frame.height - (appIconHeight+priceLabel.frame.height + 10) - 20)
        
//        textViewDidChange(descriptionText)
        
        topBarView.frame = CGRect(x: view.frame.midX+view.frame.midX/2-30, y: 20, width: view.frame.width/4, height: view.frame.height*0.1)
        
        let topBarViewWidth = topBarView.frame.width
        let topBarViewheight = topBarView.frame.height
        
        let topBarImageViewWidth = (topBarViewWidth/5)/2
        
        controllerConnectedImageView.frame = CGRect(x: 0, y: 0, width: topBarImageViewWidth, height: topBarImageViewWidth)
        
        internetConnectionImageView.frame = CGRect(x: controllerConnectedImageView.frame.width+10, y: 0, width: topBarImageViewWidth, height: topBarImageViewWidth)
        
        batteryImageView.frame = CGRect(x: internetConnectionImageView.frame.maxX+10, y: 0, width: topBarImageViewWidth, height: topBarImageViewWidth)
        
        batteryPerLabel.frame = CGRect(x: batteryImageView.frame.maxX+10, y: 0, width: topBarImageViewWidth*1.7, height: topBarImageViewWidth)
        
        timeLabel.frame = CGRect(x: batteryPerLabel.frame.maxX+10, y: controllerConnectedImageView.frame.minY, width: topBarImageViewWidth*2.2, height: topBarImageViewWidth)
        
        controllerConnectedImageView.image = topBarValue.getConsollerStatus()
        internetConnectionImageView.image = topBarValue.getNetworkConnectivityType()
        batteryImageView.image = topBarValue.getBatteryImage()
        batteryPerLabel.text = topBarValue.getBatteryPercentage()
        timeLabel.text = topBarValue.getTime()
        
        
        view.addSubview(mainScreenScrollView)
        
        imageScrollView.backgroundColor = .clear
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(backButton)
        view.addSubview(imageScrollView)
        
        
        imageScrollView.addSubview(image1)
        imageScrollView.addSubview(image2)
        imageScrollView.addSubview(image3)
        imageScrollView.addSubview(image4)
        
        mainScreenScrollView.addSubview(appIcon)
        mainScreenScrollView.addSubview(gameNameLabel)
        mainScreenScrollView.addSubview(downloadButton)
        mainScreenScrollView.addSubview(developerNameLabel)
        mainScreenScrollView.addSubview(downloadsView)
        mainScreenScrollView.addSubview(downloadLabel)
        mainScreenScrollView.addSubview(ratingsView)
        mainScreenScrollView.addSubview(ratingLabel)
        mainScreenScrollView.addSubview(priceView)
        mainScreenScrollView.addSubview(priceLabel)
        
        downloadsView.addSubview(downloadDataLabel)
        ratingsView.addSubview(ratingDataLabel)
        priceView.addSubview(priceDataLabel)
        
        
        mainScreenScrollView.addSubview(descriptionText)
        
        
        view.addSubview(topBarView)
        topBarView.addSubview(controllerConnectedImageView)
        topBarView.addSubview(internetConnectionImageView)
        topBarView.addSubview(batteryImageView)
        topBarView.addSubview(batteryPerLabel)
        topBarView.addSubview(timeLabel)
        
//        view.backgroundColor = .white
        
        imageScrollView.contentSize = CGSize(width: imageScrollView.frame.width, height: image4.frame.maxY)
        mainScreenScrollView.contentSize = CGSize(width: view.frame.width*0.6, height: descriptionText.frame.maxY)
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
        
        print(priceData)
        print("")
        
        if priceData == "0" || priceData == "Free"{
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
//    func textViewDidChange(_ textView: UITextView) {
//        let size = CGSize(width: view.frame.width, height: .infinity)
//        let estimatedSize = textView.sizeThatFits(size)
//
//        textView.constraints.forEach { (constraint) in
//            if constraint.firstAttribute == .height {
//                constraint.constant = estimatedSize.height
//            }
//        }
//    }
    
}
