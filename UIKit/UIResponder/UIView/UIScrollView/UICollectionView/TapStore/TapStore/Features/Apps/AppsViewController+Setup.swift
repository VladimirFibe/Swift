import UIKit

extension AppsViewController {
    func setupViews() {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createCompositionalLayout()
        )
        collectionView.register(
            SectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeader.reuseIdentifier
        )
        collectionView.register(
            FeaturedCell.self,
            forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier
        )
        collectionView.register(
            MediumTableCell.self,
            forCellWithReuseIdentifier: MediumTableCell.reuseIdentifier
        )
        collectionView.register(
            SmallTableCell.self,
            forCellWithReuseIdentifier: SmallTableCell.reuseIdentifier
        )
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        createDataSource()
        reloadData()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
