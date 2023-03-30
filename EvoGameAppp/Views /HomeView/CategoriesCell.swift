//
//  Categories.swift
//  EvoGameAppp
//
//  Created by sixpep on 28/03/23.
//

import Foundation
import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let indentifier = "CategoriesCell"
    
    private let imageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Rectangle")
        return imageView
    }()
    
     let text:UILabel={
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImageView = UIImageView(image: UIImage(named: "Rectangle"))
        backgroundImageView.contentMode = .scaleToFill
        backgroundView = backgroundImageView
        //contentView.addSubview(imageView)
        contentView.addSubview(text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
     //   imageView.frame = contentView.bounds
        text.sizeToFit()
        text.center = contentView.center
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    //    imageView.image = nil
        text.text = nil
    }
    
}
