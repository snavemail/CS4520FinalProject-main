//
//  AlertController.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/23/23.
//

import Foundation
import UIKit

class AlertController {
    func alertMissingField(_ delegate: UIViewController) {
        let alert = UIAlertController(title: "Field entries cannot be empty", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        
        delegate.present(alert, animated: true)
    }
    
    func alertCustom(text: String, _ delegate: UIViewController) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
        
        delegate.present(alert, animated: true)
    }
}
