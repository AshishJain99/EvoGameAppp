//
//  EvoAboutViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 23/05/23.
//

import UIKit

class EvoAboutViewController: UIViewController {
    
    let backButton:UIButton = {
        let button = UIButton()
      //  button.backgroundColor = .white
        button.setImage(UIImage(named: "leftArrowButton"), for: .normal)
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
    
    let connectionView:UIView={
       let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        //view.contentMode = .scaleAspectFit
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let conncetionViewImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_ConnectionGuide")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let connectionViewLabel:UILabel={
       let label = UILabel()
        label.text = "Connections Guide"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let userGuideView:UIView={
       let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let userGuideViewImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_UserGuide")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let userGuideLabel:UILabel={
       let label = UILabel()
        label.text = "User Guide"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    
    let faqView:UIView={
       let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let faqViewImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_FAQ")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let faqLabel:UILabel={
       let label = UILabel()
        label.text = "FAQ"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let aboutUsView:UIView={
       let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let aboutUsImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_AboutUs")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let aboutUsLabel:UILabel={
       let label = UILabel()
        label.text = "About Us"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let referEarnView:UIView={
       let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()
    
    let referEarnImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_ReferEarn")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let referEarnLabel:UILabel={
       let label = UILabel()
        label.text = "Refer & Earn"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let buyMoreView:UIView={
       let view = UIView()
        view.backgroundColor = UIColor(named: "AboutBgColor")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "AboutBgBorderColor")?.cgColor
        return view
    }()

    let buyMoreImage:UIImageView={
        let image = UIImageView()
        image.image = UIImage(named: "About_BuyMore")
        //image.backgroundColor = .green
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .clear
        return image
    }()
    
    let buyMoreLabel:UILabel={
       let label = UILabel()
        label.text = "Buy More"
        label.numberOfLines = 1 // Display text in a single line
        label.adjustsFontSizeToFitWidth = true // Enable font size adjustment
        //label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let viewHeight = view.frame.height
        let viewWidth = view.frame.width
        
        let containerHeight = viewHeight*0.27
        let containerWidth = viewWidth*0.22
        
        backButton.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        
        connectionView.frame = CGRect(x: viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        userGuideView.frame = CGRect(x: connectionView.frame.maxX+viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        faqView.frame = CGRect(x: userGuideView.frame.maxX+viewWidth*0.1, y: viewHeight*0.25, width: containerWidth, height: containerHeight)
        
        aboutUsView.frame = CGRect(x: connectionView.frame.minX, y: connectionView.frame.maxY+viewHeight*0.15, width: containerWidth, height: containerHeight)
        referEarnView.frame = CGRect(x: userGuideView.frame.minX, y: userGuideView.frame.maxY+viewHeight*0.15, width: containerWidth, height: containerHeight)
        buyMoreView.frame = CGRect(x: faqView.frame.minX, y: faqView.frame.maxY+viewHeight*0.15, width: containerWidth, height: containerHeight)
        
        conncetionViewImage.bounds = CGRect(x: 0, y: 0, width: connectionView.frame.width*0.7, height: connectionView.frame.height*0.5)
        conncetionViewImage.center = CGPoint(x: connectionView.bounds.midX, y: connectionView.bounds.midY*0.9)
        connectionViewLabel.bounds = CGRect(x: 0, y: 0, width: connectionView.frame.width * 0.7, height: connectionView.frame.height * 0.2)
            connectionViewLabel.center = CGPoint(x: connectionView.bounds.midX, y: conncetionViewImage.frame.maxY + (connectionViewLabel.bounds.height / 2) * 1.15)
        
        userGuideViewImage.bounds = CGRect(x: 0, y: 0, width: userGuideView.frame.width*0.7, height: userGuideView.frame.height*0.5)
        userGuideViewImage.center = CGPoint(x: userGuideView.bounds.midX, y: userGuideView.bounds.midY*0.9)
        userGuideLabel.bounds = CGRect(x: 0, y: 0, width: userGuideView.frame.width * 0.7, height: userGuideView.frame.height * 0.2)
        userGuideLabel.center = CGPoint(x: userGuideView.bounds.midX, y: userGuideViewImage.frame.maxY + (userGuideLabel.bounds.height / 2) * 1.15)
        
        faqViewImage.bounds = CGRect(x: 0, y: 0, width: faqView.frame.width*0.7, height: faqView.frame.height*0.5)
        faqViewImage.center = CGPoint(x: faqView.bounds.midX, y: faqView.bounds.midY*0.9)
        faqLabel.bounds = CGRect(x: 0, y: 0, width: faqView.frame.width * 0.7, height: faqView.frame.height * 0.2)
        faqLabel.center = CGPoint(x: faqView.bounds.midX, y: faqViewImage.frame.maxY + (faqLabel.bounds.height / 2) * 1.15)
        
        
        aboutUsImage.bounds = CGRect(x: 0, y: 0, width: aboutUsView.frame.width*0.7, height: aboutUsView.frame.height*0.5)
        aboutUsImage.center = CGPoint(x: aboutUsView.bounds.midX, y: aboutUsView.bounds.midY*0.9)
        aboutUsLabel.bounds = CGRect(x: 0, y: 0, width: aboutUsView.frame.width * 0.7, height: aboutUsView.frame.height * 0.2)
        aboutUsLabel.center = CGPoint(x: aboutUsView.bounds.midX, y: aboutUsImage.frame.maxY + (aboutUsLabel.bounds.height / 2) * 1.15)
        
        referEarnImage.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width*0.7, height: referEarnView.frame.height*0.5)
        referEarnImage.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnView.bounds.midY*0.9)
        referEarnLabel.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width * 0.7, height: referEarnView.frame.height * 0.2)
        referEarnLabel.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnImage.frame.maxY + (referEarnLabel.bounds.height / 2) * 1.15)
        
        buyMoreImage.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width*0.7, height: referEarnView.frame.height*0.5)
        buyMoreImage.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnView.bounds.midY*0.9)
        buyMoreLabel.bounds = CGRect(x: 0, y: 0, width: referEarnView.frame.width * 0.7, height: referEarnView.frame.height * 0.2)
        buyMoreLabel.center = CGPoint(x: referEarnView.bounds.midX, y: referEarnImage.frame.maxY + (referEarnLabel.bounds.height / 2) * 1.15)
        
        print(connectionView.center)
        
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.frame = view.bounds
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(connectionView)
        connectionView.addSubview(conncetionViewImage)
        connectionView.addSubview(connectionViewLabel)
        
        view.addSubview(userGuideView)
        userGuideView.addSubview(userGuideViewImage)
        userGuideView.addSubview(userGuideLabel)
        
        view.addSubview(faqView)
        faqView.addSubview(faqViewImage)
        faqView.addSubview(faqLabel)
        
        view.addSubview(aboutUsView)
        aboutUsView.addSubview(aboutUsImage)
        aboutUsView.addSubview(aboutUsLabel)
        
        view.addSubview(referEarnView)
        referEarnView.addSubview(referEarnImage)
        referEarnView.addSubview(referEarnLabel)
        
        view.addSubview(buyMoreView)
        buyMoreView.addSubview(buyMoreImage)
        buyMoreView.addSubview(buyMoreLabel)
        
        view.addSubview(backButton)
    }
    

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }

}
