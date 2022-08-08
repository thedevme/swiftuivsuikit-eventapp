import UIKit

protocol CollectionView {
    func register(cell: RegisterableView)
    func register(header: RegisterableView)
    func register(footer: RegisterableView)
}

extension CollectionView {
    func register(cells: [RegisterableView]) {
        cells.forEach(register(cell:))
    }

    func register(headers: [RegisterableView]) {
        headers.forEach(register(header:))
    }

    func register(footers: [RegisterableView]) {
        footers.forEach(register(footer:))
    }
}

extension UICollectionView : CollectionView {
    func register(cell: RegisterableView) {
        switch cell {
        case .nib:
            register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
        case .class:
            register(cell.cellClass, forCellWithReuseIdentifier: cell.identifier)
        }
    }

    func register(header: RegisterableView) {
        register(supplementaryView: header, kind: UICollectionView.elementKindSectionHeader)
    }

    func register(footer: RegisterableView) {
        register(supplementaryView: footer, kind: UICollectionView.elementKindSectionFooter)
    }

    func register(supplementaryView view: RegisterableView, kind: String) {
        switch view {
        case .nib:
            register(view.nib, forSupplementaryViewOfKind:kind , withReuseIdentifier: view.identifier)
        case .class:
            register(view.cellClass, forSupplementaryViewOfKind:kind , withReuseIdentifier: view.identifier)
        }
    }
}
