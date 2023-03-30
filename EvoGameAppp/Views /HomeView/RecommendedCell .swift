//
//  HomeCell.swift
//  EvoGameAppp
//
//  Created by sixpep on 28/03/23.
//

import Foundation
import UIKit

class RecommendedCell: UICollectionViewCell {
    
    static let indentifier = "RecommendedCell"
    
   private let recommendedImageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let recommendedTextLabel:UILabel={
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(recommendedImageView)
        contentView.addSubview(recommendedTextLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        recommendedImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height*0.8)
        recommendedTextLabel.frame = CGRect(x: 0, y: recommendedImageView.frame.maxY, width: contentView.frame.width, height: contentView.frame.height*0.17)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recommendedImageView.image = nil
        recommendedTextLabel.text = nil
    }
    
    func recommendedGetImage(urlString: String){
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.recommendedImageView.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
    }
    
}
