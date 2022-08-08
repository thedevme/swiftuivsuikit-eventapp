import UIKit

final class EventListCell: UICollectionViewCell {
    static let kind = String(describing: EventListCell.self)
    static let reuseIdentifier = String(describing: EventListCell.self)
    static let nib = UINib(nibName: String(describing: EventListCell.self), bundle: nil)
}
