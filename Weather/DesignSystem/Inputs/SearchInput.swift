//
//  SearchInput.swift
//

import UIKit

final class SearchInput: UIView {
    private enum Constants {
        static let cornerRadius: CGFloat = 4.0
        static let borderWidth: CGFloat = 1.0
        static let color: UIColor = .lightGray
        static let margin: CGFloat = 12.0
        static let height: CGFloat = 48.0
        static let iconSize: CGSize = CGSize(width: 24, height: 24)
    }

    init() {
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var textDidChange: ((String?) -> Void)?
    var textFieldDelegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = textFieldDelegate
        }
    }

    let textField = UITextField()

    private let stackView = UIStackView()
    private let searchIconView = UIImageView()
    private let clearTextButton = UIButton(type: .system)

    private func setup() {
        setupBorder()
        setupStackView()
        setupSearchIconView()
        setupTextField()
        setupClearTextButton()
    }

    private func setupBorder() {
        layer.cornerRadius = Constants.cornerRadius
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Constants.color.cgColor
    }

    private func setupStackView() {
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.margin),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.margin),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.margin),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.margin),
        ])
    }

    private func setupSearchIconView() {
        stackView.addArrangedSubview(searchIconView)

        searchIconView.translatesAutoresizingMaskIntoConstraints = false
        searchIconView.image = Images.searchIcon
        searchIconView.tintColor = Constants.color

        NSLayoutConstraint.activate([
            searchIconView.widthAnchor.constraint(equalToConstant: Constants.iconSize.width),
            searchIconView.heightAnchor.constraint(equalToConstant: Constants.iconSize.height)
        ])
    }

    private func setupTextField() {
        stackView.addArrangedSubview(textField)

        textField.tintColor = Constants.color
        textField.addTarget(self,
                            action: #selector(didTextChange),
                            for: .editingChanged)
    }

    private func setupClearTextButton() {
        stackView.addArrangedSubview(clearTextButton)

        clearTextButton.setImage(Images.clearIcon, for: .normal)
        clearTextButton.tintColor = .black
        clearTextButton.isHidden = true
        clearTextButton.addTarget(self, action: #selector(clearTextButtonDidTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            clearTextButton.widthAnchor.constraint(equalToConstant: Constants.iconSize.width),
            clearTextButton.heightAnchor.constraint(equalToConstant: Constants.iconSize.height)
        ])
    }

    @objc private func didTextChange() {
        determineClearTextButtonVisiblity()
        textDidChange?(textField.text)
    }

    @objc private func clearTextButtonDidTapped() {
        textField.text = nil
        textField.resignFirstResponder()
        didTextChange()
        determineClearTextButtonVisiblity()
    }

    private func determineClearTextButtonVisiblity() {
        clearTextButton.isHidden = textField.text?.isEmpty == true || textField.text == nil
    }
}
