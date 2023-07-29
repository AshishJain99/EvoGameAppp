//
//  ComingSoonViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 29/07/23.
//

import UIKit

class ComingSoonViewController: UIViewController {
    
    let backButton:UIButton = {
        let button = UIButton()
      //  button.backgroundColor = .white
        button.setImage(UIImage(named: "leftArrowButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let buttonWidth = view.frame.width * 0.05
        
        backButton.frame = CGRect(x: 20, y: 20, width: buttonWidth, height: buttonWidth)
        view.addSubview(backButton)
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
    
}
