import Foundation
import UIKit

enum RegisterableView {
    case nib(NSObject.Type)
    case `class`(NSObject.Type)
}

extension RegisterableView {
    var nib: UINib? {
        switch self {
        case let .nib(cellClass):
            return UINib(nibName: String(describing: cellClass), bundle: nil)
        default:
            return nil
        }
    }

    var cellClass: AnyClass? {
        switch self {
        case let .class(cellClass):
            return cellClass
        default:
            return nil
        }
    }

    var identifier: String {
        switch self {
        case let .nib(cellClass):
            return cellClass.identifier()
        case let .class(cellClass):
            return cellClass.identifier()
        }
    }
}

protocol ClassIdentifiable {
    static func identifier() -> String
}

extension NSObject: ClassIdentifiable {
    static func identifier() -> String {
        return String(describing: self)
    }
}
