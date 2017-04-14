//
//  DropShadow.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-13.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

protocol DropShadow { }

extension DropShadow where Self: UIView {
    func addDropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 8
        
    }
}
