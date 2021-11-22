//
//  Human Computer Interaction, ETH Zürich
//  Copyright © 2021 Alexandre Reol. All rights reserved.
//

import Foundation

class DigitToSymbol {
    static func getString(bold: String, light: String, value: Double) -> String {
        assert((1...5).contains(value), "Value must be between 1 and 5")
        var result = String(repeating: bold, count: Int(value))
        result.append(String(repeating: light, count: 5 - Int(value)))
        return result
    }
}
