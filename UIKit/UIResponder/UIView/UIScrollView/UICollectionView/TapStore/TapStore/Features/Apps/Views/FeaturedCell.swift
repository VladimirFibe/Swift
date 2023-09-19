import UIKit

class FeaturedCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "FeaturedCell"

    private let tagline = {
        $0.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .bold))
        $0.textColor = .systemBlue
        return $0
    } (UILabel())

    private let name = {
        $0.font = UIFont.preferredFont(forTextStyle: .title2)
        $0.textColor = .label
        return $0
    } (UILabel())

    private let subtitle = {
        $0.font = UIFont.preferredFont(forTextStyle: .title2)
        $0.textColor = .secondaryLabel
        return $0
    } (UILabel())

    private let imageView = {
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

    private let separator = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .quaternaryLabel
        return $0
    }(UIView(frame: .zero))

    private lazy var stackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        return $0
    }(UIStackView(arrangedSubviews: [separator, tagline, name, subtitle, imageView]))

    func configure(with app: App) {
        tagline.text = app.tagline.uppercased()
        name.text = app.name
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Not happening")
    }
}

extension FeaturedCell {
    func setupViews() {
        contentView.addSubview(stackView)
        stackView.setCustomSpacing(10, after: separator)
        stackView.setCustomSpacing(10, after: subtitle)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),

            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
