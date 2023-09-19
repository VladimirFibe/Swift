import UIKit

class SmallTableCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "SmallTableCell"

    private let name = {
        $0.font = UIFont.preferredFont(forTextStyle: .title2)
        $0.textColor = .label
        return $0
    }(UILabel())

    private let imageView = {
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        return $0
    }(UIImageView())

    private lazy var stackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .center
        $0.spacing = 20
        return $0
    }(UIStackView(arrangedSubviews: [imageView, name]))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    func configure(with app: App) {
        name.text = app.name
        imageView.image = UIImage(named: app.image)
    }

    required init?(coder: NSCoder) { fatalError() }
}

extension SmallTableCell {
    private func setupViews() {
        contentView.addSubview(stackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
