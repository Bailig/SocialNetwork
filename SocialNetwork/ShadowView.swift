//
//  ShadowView.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-13.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

class ShadowView: UIView, DropShadow {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addDropShadow()
    }
}

