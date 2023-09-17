import UIKit

class ReminderListViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: listLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .green
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

extension ReminderListViewController {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Today"
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor,
                multiplier: 2
            ),
            collectionView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor,
                multiplier: 2
            ),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(
                equalToSystemSpacingAfter: collectionView.trailingAnchor,
                multiplier: 2
            ),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(
                equalToSystemSpacingBelow: collectionView.bottomAnchor,
                multiplier: 2
            )
        ])
    }
}

