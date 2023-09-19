import UIKit

class MediumTableCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "MediumTableCell"

    private let name = {
        $0.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.textColor = .label
        return $0
    }(UILabel())

    private let subtitle = {
        $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
        $0.textColor = .secondaryLabel
        return $0
    }(UILabel())

    private let imageView = {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIImageView())

    private let buyButton = {
        $0.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)
        return $0
    }(UIButton(type: .custom))

    private lazy var innerStackView = {
        $0.axis = .vertical
        return $0
    }(UIStackView(arrangedSubviews: [name, subtitle]))

    private lazy var outerStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .center
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [imageView, innerStackView, buyButton]))

    func configure(with app: App) {
        name.text = app.name
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) { fatalError() }
}

extension MediumTableCell {
    private func setupViews() {
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        buyButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        contentView.addSubview(outerStackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
}
