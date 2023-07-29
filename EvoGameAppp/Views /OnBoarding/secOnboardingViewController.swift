//
//  secOnboardingViewController.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 26/07/23.
//

import UIKit

class secOnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        print("hello")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "lastOnboardingViewController") as? lastOnboardingViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
