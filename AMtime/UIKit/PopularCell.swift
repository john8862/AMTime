//
//  PopularCell.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

class PopularCell: UICollectionViewCell {
    static let reuseId: String = "PopularCell"
    var popular: Popular? {
        didSet {
            // Update cell content when popular data changes
            if let movie = self.popular {
                imageView.image = UIImage(named: "\(movie.image).jpg")
                titleLabel.text = movie.title
            }
        }
    }
    
    // Image view with lazy loading and styling
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "adastra.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    // Title label with styling and auto layout constraints
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad Astra"
        label.textColor = UIColor(named: "textColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .secondaryLabel
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    // Required initializer for storyboards (not used here)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Setup cell UI elements and constraints
    private func setupCell() {
        addSubview(imageView)
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            // Constraints for imageView (filling the cell width and having a 3:2 aspect ratio)
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 3 / 2),
            
            // Constraints for titleLabel (below the image and filling the cell width)
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}

#Preview() {
    PopularCell()
}
