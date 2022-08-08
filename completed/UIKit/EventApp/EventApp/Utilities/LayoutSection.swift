import Foundation
import UIKit

protocol LayoutSection {
    static func card() -> NSCollectionLayoutSection
}

struct LayoutSectionFactory: LayoutSection {
    static func card() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.92))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.92))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    static func header() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(73), heightDimension: .absolute(68))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75), heightDimension: .estimated(82))
        let innerGroup = NSCollectionLayoutGroup.vertical(layoutSize: innerGroupSize, subitems: [item])
        innerGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 85, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(68))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [innerGroup])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(75))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: EventCardHeader.kind, alignment: .leading)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    static func list() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(175))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(175))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(75))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ListSectionHeaderView.kind, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        sectionHeader.pinToVisibleBounds = true

        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }
}
