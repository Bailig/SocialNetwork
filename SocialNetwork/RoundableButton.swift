//
//  Roundable.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-14.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

protocol RoundableButton { }

extension RoundableButton where Self: UIButton {
    func addRoundedCorners() {
        backgroundColor = UIColor.clear
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor(colorLiteralRed: 142, green: 124, blue: 121, alpha: 1).cgColor
    }
}
