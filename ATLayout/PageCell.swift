//
//  PageCell.swift
//  ATLayout
//
//  Created by Burit Boonkorn on 15/7/2566 BE.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page: Page? {
        didSet {
//            print(page?.imageName)
            guard let unwrappedPage = page else { return }
            
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText = NSMutableAttributedString(
                string: unwrappedPage.headerText,
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
                ]
            )
            attributedText.append(
                NSAttributedString(
                    string:"\n\n\n \(unwrappedPage.bodyText)",
                    attributes: [
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                        NSAttributedString.Key.foregroundColor: UIColor.gray
                    ]
                )
            )
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        //** this enable autolayout for out imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(
            string: "Join us today in our fun and games!",
            attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
            ]
        )
        attributedText.append(
            NSAttributedString(
                string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                    NSAttributedString.Key.foregroundColor: UIColor.gray
                ]
            )
        )
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    private let topImageContainerView: UIView = {
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        return topImageContainerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(topImageContainerView)
        
        let topImageContainerConstraints = [
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)

        ]
        topImageContainerView.addSubview(bearImageView)
       
        let bearImageViewContraints = [
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5)
        ]
        addSubview(descriptionTextView)
        
        let descriptionTextViewConstraints = [
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ]
        
        NSLayoutConstraint.activate(topImageContainerConstraints)
        NSLayoutConstraint.activate(bearImageViewContraints)
        NSLayoutConstraint.activate(descriptionTextViewConstraints)
    }
}
