//
//  lastOnboardingViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 26/07/23.
//

import UIKit

class lastOnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        print("hello")
        
        
//        HomeViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    

}
