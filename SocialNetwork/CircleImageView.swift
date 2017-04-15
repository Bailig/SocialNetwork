//
//  CircleImageView.swift
//  SocialNetwork
//
//  Created by Bailig Abhanar on 2017-04-15.
//  Copyright © 2017 Bailig Abhanar. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView, Circlable {
    override func awakeFromNib() {
        super.awakeFromNib()
        addCircle()
        
    }
}
