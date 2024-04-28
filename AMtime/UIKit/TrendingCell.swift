//
//  TrendingCell.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import UIKit
import Kingfisher

class TrendingCell: UICollectionViewCell {
    // Static identifier for cell reuse
    static let reuseId: String = "TrendingCell"

    // Optional trending data model
    var movie: MovieViewModel? {
        didSet {
            if let movie = self.movie {
                // This line use kingFisher to download, set the image to the image view and caching it at the same time
                imageView.kf.setImage(with: movie.backdropUrl)
                titleLabel.text = movie.title
            }
        }
    }

    // Image view with lazy loading and styling
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "adastra_land.jpg")
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
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .white
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
        /// Create a gradient view for a fading effect on the image
        let gradientView = UIView(frame: CGRect(x: 0, y: frame.height / 4, width: frame.width, height: frame.height / 2))
        gradientView.layer.cornerRadius = 20
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.frame
        gradient.colors = [UIColor.clear, UIColor.black.cgColor]
        gradientView.layer.insertSublayer(gradient, at: 0)

        /// Add subviews and activate constraints
        contentView.addSubview(imageView)
        imageView.addSubview(gradientView)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            /// Constraints for imageView
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1),

            /// Constraints for titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

#Preview() {
    TrendingCell()
}
