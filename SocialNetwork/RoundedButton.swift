//
//  RoundedButton.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-14.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

class RoundedButton: UIButton, RoundableButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        addRoundedCorners()
        
    }
}
