import UIKit
import Kingfisher

class NewsViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, ArticleModel.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, ArticleModel.ID>
    var dataSource: DataSource!
    private let store = NewsStore()
    private var bag = Bag()

    var news: [ArticleModel] = [] //ArticleModel.all
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
        id: ArticleModel.ID
    ) {
        let item = news(withId: id)
        var contentConfigureation = cell.defaultContentConfiguration()
        contentConfigureation.text = item.title
        contentConfigureation.image = UIImage(named: "2")
        contentConfigureation.imageProperties.cornerRadius = 16
        contentConfigureation.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        contentConfigureation.imageToTextPadding = 20
        contentConfigureation.secondaryText = item.description
        contentConfigureation.secondaryTextProperties.font = .preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfigureation
        cell.accessories = [
//            .customView(configuration: photoConfiguration(for: item)),
            .disclosureIndicator(displayed: .always)
        ]
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .systemGray2
        cell.backgroundConfiguration = backgroundConfiguration
    }

    func updateSnapshot(reloading ids: [ArticleModel.ID] = []) {
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

    private func news(withId id: ArticleModel.ID) -> ArticleModel {
        let index = news.indexOfNews(withId: id)
        return news[index]
    }

    private func updateReminder(_ item: ArticleModel) {
        let index = news.indexOfNews(withId: item.id)
        news[index] = item
    }

    private func photoConfiguration(for item: ArticleModel) -> UICellAccessory.CustomViewConfiguration {
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

        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: ArticleModel.ID) in
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

    private func callAPI() {
        Task {
            do {
                let result: ArticleResponse = try await RESTClient.shared.request(.search, parameters: ["domains": "wsj.com"])
                news = result.articles.map { ArticleModel(with: $0)}
                updateSnapshot()
            } catch {}
        }
    }

    private func fetchNews() {
        Task {
            do {
                guard let url = URL(string: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=9e72db7ad0a84a2597eefbb6690a48ac") else { return }
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let result = try? JSONDecoder().decode(ArticleResponse.self, from: data)
                else { return }
                news = result.articles.map { ArticleModel(with: $0)}
                updateSnapshot()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension NewsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text ?? "")
        guard let text = searchBar.text else { return }
        store.handleActions(.search(text))
    }
}
