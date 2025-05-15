//
//  HomeView.swift
//  Reminder
//
//  Created by Samuel França on 15/05/25.
//

import UIKit

class HomeView: UIView {
    public weak var flowDelegate: HomeViewDelegate?
    
    let profileBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray400
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentBrackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Boas Vidas"
        label.textColor = .black
        label.font = Typography.input
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Avaliar", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(profileBackground)
        profileBackground.addSubview(profileImage)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameLabel)
        
        addSubview(contentBrackground)
        contentBrackground.addSubview(feedbackButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackground.topAnchor.constraint(equalTo: topAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: 200),

            profileImage.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: 48),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: 24),
            profileImage.heightAnchor.constraint(equalToConstant: 68),
            profileImage.widthAnchor.constraint(equalToConstant: 68),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 48),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: 24),

            contentBrackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBrackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBrackground.topAnchor.constraint(equalTo: profileBackground.bottomAnchor),
            contentBrackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedbackButton.bottomAnchor.constraint(equalTo: contentBrackground.bottomAnchor, constant: -24),
            feedbackButton.leadingAnchor.constraint(equalTo: contentBrackground.leadingAnchor, constant: 24),

        ])

        
        
    }
}
