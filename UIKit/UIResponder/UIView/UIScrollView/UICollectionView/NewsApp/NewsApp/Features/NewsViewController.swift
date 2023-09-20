import UIKit
import SwiftUI
import Kingfisher

class NewsViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Article.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Article.ID>
    var dataSource: DataSource!
    private let store = NewsStore()
    private var bag = Bag()

    var news: [Article] = Bundle.main.decode(ArticleResponse.self, from: "News.json").articles
    private var searchController = UISearchController(searchResultsController: nil)
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false

        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: listLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupContstraints()
        setupObservers()
        store.sendAction(.fetch)
    }

    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                guard let self = self else { return }
                switch event {
                case let .reload(newArticles):
                    self.news = newArticles
                    self.updateSnapshot()
                }
            }.store(in: &bag)
    }

    func cellRegistrationHandler(
        cell: UICollectionViewListCell,
        indexPath: IndexPath,
        id: Article.ID
    ) {
        let item = news(withId: id)
//        cell.contentConfiguration = UIHostingConfiguration {
//            Image(item.source.id)
//        }
        var contentConfigureation = cell.defaultContentConfiguration()
        contentConfigureation.text = item.title
        contentConfigureation.textProperties.font = .boldSystemFont(ofSize: 14)
        contentConfigureation.image = UIImage(named: item.source.id)
        contentConfigureation.imageProperties.cornerRadius = 16
        contentConfigureation.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        contentConfigureation.imageToTextPadding = 10
        contentConfigureation.secondaryText = item.source.name
        contentConfigureation.secondaryTextProperties.font = .preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfigureation

        cell.accessories = [
            .customView(configuration: doneButtonConfiguration()),
            .disclosureIndicator(displayed: .always)
        ]
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .secondarySystemBackground
        cell.backgroundConfiguration = backgroundConfiguration

   }

    private func doneButtonConfiguration() -> UICellAccessory.CustomViewConfiguration {
        let symbolName = "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .body)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(
            customView: button,
            placement: .leading(displayed: .always)
        )
    }

    func updateSnapshot(reloading ids: [Article.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(news.map { $0.id })
        if !ids.isEmpty { snapshot.reloadItems(ids)}
        dataSource.apply(snapshot)
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

    private func news(withId id: Article.ID) -> Article {
        let index = news.indexOfNews(withId: id)
        return news[index]
    }

    private func updateReminder(_ item: Article) {
        let index = news.indexOfNews(withId: item.id)
        news[index] = item
    }

    private func photoConfiguration(for item: Article) -> UICellAccessory.CustomViewConfiguration {
        let image = UIImage(named: "0")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        let url = URL(string: item.urlToImage)
        imageView.kf.setImage(with: url)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        return UICellAccessory.CustomViewConfiguration(
            customView: imageView,
            placement: .leading(displayed: .always)
        )
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.title = "Today"
        view.addSubview(collectionView)
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)

        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Article.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }

        updateSnapshot()

        collectionView.dataSource = dataSource
    }

    private func setupContstraints() {
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

extension NewsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text ?? "")
        guard let text = searchBar.text else { return }
        store.handleActions(.search(text))
    }
}
