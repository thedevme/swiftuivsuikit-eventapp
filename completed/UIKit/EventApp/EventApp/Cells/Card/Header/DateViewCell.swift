import UIKit

final class DateViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: DateViewCell.self)
    static let nib = UINib(nibName: String(describing: DateViewCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
