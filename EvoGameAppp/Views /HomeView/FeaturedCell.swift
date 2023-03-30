//
//  FeaturedCell.swift
//  EvoGameAppp
//
//  Created by sixpep on 27/03/23.
//

import Foundation
import UIKit

class FeaturedCell: UICollectionViewCell {
    
    static let indentifier = "FeaturedCell"
    
   private let imageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let textLabel:UILabel={
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height*0.8)
        textLabel.frame = CGRect(x: 0, y: imageView.frame.maxY, width: contentView.frame.width, height: contentView.frame.height*0.17)
//        textLabel.sizeToFit()
//        textLabel.center = contentView.center
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        textLabel.text = nil
    }
    
    func getImage(urlString: String){
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlString) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
              //  activityIndicator.stopAnimating()
            }
        }
    }
    
    func getAppName(AppName:String){
        textLabel.text = AppName
    }
}
