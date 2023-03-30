//
//  OnboardingViewController.swift
//  EvoGameAppp
//
//  Created by sixpep on 20/03/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var x = 0
    
    var slides:[OnboardingSlide] = []
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slides = [
            OnboardingSlide(title: "This is some Random heading", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ", image: UIImage(systemName: "person")!),
            OnboardingSlide(title: "This is some Random heading too", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ", image: UIImage(systemName: "car")!),
            OnboardingSlide(title: "Yes,This is some Random heading", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ", image: UIImage(systemName: "person.fill")!),
        ]
        
        // Do any additional setup after loading the view.
        
        collectionView.isUserInteractionEnabled = true
        
        
    }


    
}

extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize{
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        pageControl.currentPage = currentPage
        
        
    }
    
    
    
}
