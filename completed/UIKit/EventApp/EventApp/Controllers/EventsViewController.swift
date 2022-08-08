import UIKit

enum ListType {
    case card
    case list
}

class EventsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnListGrid: UIBarButtonItem!
    
    private var listType:ListType = .list
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    private var sections: [Section] = []
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[sectionIndex].kind
            
            switch sectionKind {
            case .card:     return LayoutSectionFactory.card()
            case .header:   return LayoutSectionFactory.header()
            case .list:     return LayoutSectionFactory.list()
            default:        return nil
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        setupCollectionView()
        configureDataSource()
        configureSupplementaryView()
        createCardData()
    }
    
    func setupCollectionView() {
        let cells: [RegisterableView] = [
            .nib(EventCardCell.self),
            .nib(DateViewCell.self),
            .nib(EventListCell.self)
        ]
        
        collectionView.register(cells: cells)
        collectionView.register(EventCardHeader.nib, forSupplementaryViewOfKind: EventCardHeader.kind, withReuseIdentifier: EventCardHeader.reuseIdentifier)
        collectionView.register(ListSectionHeaderView.nib, forSupplementaryViewOfKind: ListSectionHeaderView.kind, withReuseIdentifier: ListSectionHeaderView.reuseIdentifier)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func createCardData() {
        sections = [
            Section(kind: .header, items: [
                Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item()
            ]),
            Section(kind: .card, items: [
                Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item(),
                Item(), Item()
            ])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func createListData() {
        sections = [
            Section(kind: .list, items: [
                Item(), Item(), Item(),
            ]),
            Section(kind: .list, items: [
                Item()
            ]),
            Section(kind: .list, items: [
                Item(), Item(), Item(),
                Item(), Item(), Item(),
            ]),
        ]

        snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            
            switch sectionKind {
            case .card:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCardCell.reuseIdentifier, for: indexPath)
                return cell
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateViewCell.reuseIdentifier, for: indexPath)
                return cell
            case .list:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventListCell.reuseIdentifier, for: indexPath)
                return cell
            default:
                return nil
            }
        }
    }
    
    private func configureSupplementaryView() {
        dataSource.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].kind
            
            switch sectionKind {
            case .card:
                return nil
            case .header:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: EventCardHeader.reuseIdentifier,
                    for: indexPath)
                return sectionHeader
                
            default:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                        ofKind: kind,
                        withReuseIdentifier: ListSectionHeaderView.reuseIdentifier,
                        for: indexPath)
                return sectionHeader
            }
        }
    }
    
    @IBAction func onListSwitchTapped(_ sender: Any) {
        if listType == .list {
            listType = .card
            btnListGrid.image = UIImage(named: "card-icon")
            createListData()
        } else {
            listType = .list
            btnListGrid.image = UIImage(named: "list-icon")
            createCardData()
        }
    }
}

extension EventsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCardCell.reuseIdentifier, for: indexPath) as! EventCardCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
}

