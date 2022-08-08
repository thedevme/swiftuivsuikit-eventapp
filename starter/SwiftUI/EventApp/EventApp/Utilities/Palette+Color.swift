import Foundation
import SwiftUI

extension Color {
    static let baseCardColor = Color("baseCardColor")
    static let baseDayBackgroundColor = Color("baseDayBackgroundColor")
    static let baseMonthBackgroundColor = Color("baseMonthBackgroundColor")
    static let basePrimaryTextColor = Color("basePrimaryTextColor")
    static let baseSecondaryTextColor = Color("baseSecondaryTextColor")
}

extension UIColor {
    static let baseCardColor = Color("baseCardColor")
    static let baseDayBackgroundColor = Color("baseDayBackgroundColor")
    static let baseMonthBackgroundColor = Color("baseMonthBackgroundColor")
    static let basePrimaryTextColor = Color("basePrimaryTextColor")
    static let baseSecondaryTextColor = Color("baseSecondaryTextColor")
    
    private static func Color(_ key: String) -> UIColor {
       if let color = UIColor(named: key, in: .main, compatibleWith: nil) {
           return color
       }

       return .black
    }
}
