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
        layer.cornerRadius = 18
        layer.borderWidth = 2
        layer.borderColor = UIColor(hue: 10, saturation: 0.15, brightness: 0.56, alpha: 1).cgColor
    }
}
