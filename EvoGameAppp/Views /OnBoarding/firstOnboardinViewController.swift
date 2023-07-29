//
//  firstOnboardinViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 26/07/23.
//

import UIKit

class firstOnboardinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        print("hello")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "secOnboardingViewController") as? secOnboardingViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            
        }

    }
}
