import UIKit

final class EventCardHeader: UICollectionReusableView {
    static let kind = String(describing: EventCardHeader.self)
    static let reuseIdentifier = String(describing: EventCardHeader.self)
    static let nib = UINib(nibName: String(describing: EventCardHeader.self), bundle: nil)
}
