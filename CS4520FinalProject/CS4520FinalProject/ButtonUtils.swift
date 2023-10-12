//
//  ButtonUtils.swift
//  CS4520FinalProject
//
//  Created by Kenny Lin on 6/25/23.
//

import Foundation
import UIKit

extension UIButton {

    open override var isEnabled: Bool{
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }

}
