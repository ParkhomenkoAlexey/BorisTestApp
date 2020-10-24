//
//  UIViewController + Extension.swift
//  BorisTestApp
//
//  Created by Пархоменко Алексей on 24.10.2020.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, completion: @escaping () -> Void = { }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        
        self.dismiss(animated: true) {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
