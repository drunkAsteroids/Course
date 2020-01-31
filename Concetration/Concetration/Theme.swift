//
//  Theme.swift
//  Concetration
//
//  Created by Yury Sinev on 31.01.2020.
//  Copyright © 2020 asu. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    let emoji: [Emoji]
    let name: String
    let backCardColor: UIColor
    
    init(_emojiArray: [Emoji], _name: String, _backCardColor: UIColor) {
        emoji = _emojiArray
        name = _name
        backCardColor = _backCardColor
    }
}
