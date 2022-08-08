import Foundation

struct Kind: RawRepresentable, Hashable {
    typealias RawValue = String
    var rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }

    static let card = Kind(rawValue: Section.App.card.rawValue)
    static let header = Kind(rawValue: Section.App.header.rawValue)
    static let list = Kind(rawValue: Section.App.list.rawValue)
}
