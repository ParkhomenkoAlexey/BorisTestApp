//
//  TableViewTrackCell.swift
//  BorisTestApp
//
//  Created by Пархоменко Алексей on 23.10.2020.
//

import Foundation
import UIKit

class TableViewTrackCell: UITableViewCell {
    
    static let reuseId = "TableViewTrackCell"
    
    let trackImageView = UIImageView()
    let trackNameLabel = UILabel()
    let artistNameLabel = UILabel()
    let collectionNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .blue
        
        setupElements()
        setupConstraints()
    }
    
    private func setupElements() {
        trackImageView.backgroundColor = .red
        trackNameLabel.text = "Red Lond (Deluxe) Lond (Deluxe) v Lond (Deluxe) Lond (Deluxe)"
        artistNameLabel.text = "Queen"
        collectionNameLabel.text = "Lond (Deluxe)"
        
        trackNameLabel.font = UIFont.systemFont(ofSize: 14)
        
        artistNameLabel.font = UIFont.systemFont(ofSize: 12)
        artistNameLabel.textColor = .gray
        
        collectionNameLabel.font = UIFont.systemFont(ofSize: 12)
        collectionNameLabel.textColor = .gray
        
        trackImageView.translatesAutoresizingMaskIntoConstraints = false
        trackNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        addSubview(trackImageView)
        addSubview(trackNameLabel)
        addSubview(artistNameLabel)
        addSubview(collectionNameLabel)
    
        NSLayoutConstraint.activate([
            trackImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            trackImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            trackImageView.heightAnchor.constraint(equalToConstant: 52),
            trackImageView.widthAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            trackNameLabel.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: 8),
            trackNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            trackNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            artistNameLabel.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: 8),
            artistNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 3),
            artistNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            collectionNameLabel.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: 8),
            collectionNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 3),
            collectionNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
