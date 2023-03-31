//
//  CategortCollectionCell.swift
//  EvoGameAppp
//
//  Created by sixpep on 31/03/23.
//

import Foundation
import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    static let indentifier = "CategoryCollectionCell"
    
   private let CategoryImageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let CategoryTextLabel:UILabel={
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(CategoryImageView)
        contentView.addSubview(CategoryTextLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        CategoryImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height*0.8)
        CategoryTextLabel.frame = CGRect(x: 0, y: CategoryImageView.frame.maxY, width: contentView.frame.width, height: contentView.frame.height*0.17)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        CategoryImageView.image = nil
        CategoryTextLabel.text = nil
    }
    
    func recommendedGetImage(urlString: String){
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.CategoryImageView.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
    }
    
}
