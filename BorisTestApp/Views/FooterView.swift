//
//  FooterView.swift
//  BorisTestApp
//
//  Created by Пархоменко Алексей on 25.10.2020.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    private var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loader: UIActivityIndicatorView = {
       let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myLabel)
        addSubview(loader)
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func showLoader(_ title: String?) {
        loader.startAnimating()
        myLabel.text = title
    }
    
    func stopAnimating() {
        loader.stopAnimating()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
