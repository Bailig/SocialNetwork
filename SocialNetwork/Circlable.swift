//
//  Circlable.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-15.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

protocol Circlable {}

extension Circlable where Self: UIImageView {
    func addCircle() {
        layer.cornerRadius = self.frame.width / 2
    }
}
