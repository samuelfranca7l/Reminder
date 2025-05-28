//
//  RemedyCell.swift
//  Reminder
//
//  Created by Samuel França on 28/05/25.
//

import UIKit

class RemedyCell: UITableViewCell {
    
    static let identifier = "RemedyCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.subHeading
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.tag
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recurrenceBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let recurrenceLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.tag
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let watchIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "watch"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recurrenceIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "recurrence-icon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "trash")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = Colors.gray700
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeBackgroundView)
        contentView.addSubview(recurrenceBackgroundView)
        contentView.addSubview(trashButton)
        
        timeBackgroundView.addSubview(watchIcon)
        timeBackgroundView.addSubview(timeLabel)
        
        recurrenceBackgroundView.addSubview(recurrenceIcon)
        recurrenceBackgroundView.addSubview(recurrenceLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.small),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.small),
            
            timeBackgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            timeBackgroundView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            timeBackgroundView.widthAnchor.constraint(equalToConstant: 74),
            
            watchIcon.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            watchIcon.leadingAnchor.constraint(equalTo: timeBackgroundView.leadingAnchor, constant: Metrics.tiny),
            watchIcon.heightAnchor.constraint(equalToConstant: 16),
            watchIcon.widthAnchor.constraint(equalToConstant: 16),
            
            timeLabel.centerYAnchor.constraint(equalTo: watchIcon.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: watchIcon.trailingAnchor, constant: Metrics.tiny),
            
            recurrenceBackgroundView.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            recurrenceBackgroundView.leadingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: Metrics.tiny),
            recurrenceBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            recurrenceBackgroundView.widthAnchor.constraint(equalToConstant: 130),
            
            recurrenceIcon.centerYAnchor.constraint(equalTo: recurrenceBackgroundView.centerYAnchor),
            recurrenceIcon.leadingAnchor.constraint(equalTo: recurrenceBackgroundView.leadingAnchor, constant: Metrics.tiny),
            
            recurrenceLabel.centerYAnchor.constraint(equalTo: recurrenceIcon.centerYAnchor),
            recurrenceLabel.leadingAnchor.constraint(equalTo: recurrenceIcon.trailingAnchor, constant: Metrics.tiny),
            
            trashButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            trashButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.tiny),
        ])
    }
    func configure(title: String, time: String, recurrence: String) {
        titleLabel.text = title
        timeLabel.text = time
        recurrenceLabel.text = recurrence
    }
}
