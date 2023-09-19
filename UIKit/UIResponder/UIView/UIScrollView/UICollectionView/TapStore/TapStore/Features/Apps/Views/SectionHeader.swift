import UIKit

class SectionHeader: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeader"

    let title = {
        $0.textColor = .label
        $0.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return $0
    }(UILabel())

    let subtitle = {
        $0.textColor = .secondaryLabel
        return $0
    }(UILabel())

    let separator = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .quaternaryLabel
        return $0
    }(UIView(frame: .zero))

    private lazy var stackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        return $0
    }(UIStackView(arrangedSubviews: [separator, title, subtitle]))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) { fatalError() }
}

extension SectionHeader {
    private func setupViews() {
        addSubview(stackView)
        stackView.setCustomSpacing(10, after: separator)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}


