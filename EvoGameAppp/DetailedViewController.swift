//
//  DetailedViewController.swift
//  EvoGameAppp
//
//  Created by sixpep on 30/03/23.
//

import UIKit

class DetailedViewController: UIViewController {

    let imageScrollView=UIScrollView()
    let contentScrollView=UIScrollView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.frame = view.bounds
        
        backButton.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        imageScrollView.frame = CGRect(x: backButton.frame.minX, y: backButton.frame.maxY, width: view.frame.width*0.3, height: view.frame.height-backButton.frame.maxY)
        contentScrollView.frame = CGRect(x: imageScrollView.frame.maxX+10, y: imageScrollView.frame.minY, width: view.frame.width-imageScrollView.frame.width-10, height: view.frame.height-backButton.frame.maxY)
        
        image1.frame = CGRect(x: 0, y: 0, width: imageScrollView.frame.width, height: view.frame.height/3)
        image2.frame = CGRect(x: 0, y: image1.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        image3.frame = CGRect(x: 0, y: image2.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        image4.frame = CGRect(x: 0, y: image3.frame.maxY+20, width: imageScrollView.frame.width, height: view.frame.height/3)
        
        appIcon.frame = CGRect(x: 20, y: 0, width: view.frame.width*0.1, height: view.frame.width*0.1)
        appIcon.layer.cornerRadius = 10
        
        gameNameLabel.frame = CGRect(x: appIcon.frame.maxX+5, y: appIcon.frame.minY, width: view.frame.width-appIcon.frame.maxX, height: appIcon.frame.height*0.45)
        
        developerNameLabel.frame = CGRect(x: appIcon.frame.maxX+5, y: gameNameLabel.frame.maxY, width: view.frame.width-appIcon.frame.maxX, height: appIcon.frame.height*0.35)
        descriptionText.frame = CGRect(x: appIcon.frame.minX, y: appIcon.frame.maxY+10, width: contentScrollView.frame.width-appIcon.frame.minX-20, height: view.frame.height-descriptionText.frame.minY)
        
        imageScrollView.backgroundColor = .clear
        contentScrollView.backgroundColor = .clear
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(backButton)
        view.addSubview(imageScrollView)
        view.addSubview(contentScrollView)
        
        imageScrollView.addSubview(image1)
        imageScrollView.addSubview(image2)
        imageScrollView.addSubview(image3)
        imageScrollView.addSubview(image4)
        
        contentScrollView.addSubview(appIcon)
        contentScrollView.addSubview(gameNameLabel)
        contentScrollView.addSubview(developerNameLabel)
        contentScrollView.addSubview(descriptionText)
        
        imageScrollView.contentSize = CGSize(width: imageScrollView.frame.width, height: image4.frame.maxY)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
    
    func setBackG(CoverImage: String,Screenshot1:String,Screenshot2:String,Screenshot3:String,Screenshot4:String,Icon:String,gameName:String,devName:String,description:String){
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
        
        gameNameLabel.text = gameName
        developerNameLabel.text = devName
        descriptionText.text = description

    }
    
}


