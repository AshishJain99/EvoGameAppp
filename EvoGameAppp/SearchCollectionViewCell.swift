//
//  SearchCollectionViewCell.swift
//  EvoGameAppp
//
//  Created by Ashish Jain on 15/05/23.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let indentifier = "SearchCollectionViewCell"
    
   private let searchImageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let searchTextLabel:UILabel={
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(searchImageView)
        contentView.addSubview(searchTextLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        searchImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height*0.8)
        searchTextLabel.frame = CGRect(x: 0, y: searchImageView.frame.maxY, width: contentView.frame.width, height: contentView.frame.height*0.17)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        searchImageView.image = nil
        searchTextLabel.text = nil
    }
    
    func recommendedGetImage(urlString: String){
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.searchImageView.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
    }
    
}
