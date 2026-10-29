//
//  ColorPickerViewController.swift
//  DelegationAssignment
//
//  Created by Amit Kamat on 29/10/26.
//


import UIKit

class ColorPickerViewController: UIViewController {
    
    weak var delegate: ColorSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupColorButtons()
    }

    func setupColorButtons() {
        let redButton = createButton(title: "Red", color: UIColor(red: 1.0, green: 0.3, blue: 0.3, alpha: 1.0))
        let blueButton = createButton(title: "Blue", color: UIColor(red: 0.3, green: 0.3, blue: 1.0, alpha: 1.0))
        let greenButton = createButton(title: "Green", color: UIColor(red: 0.3, green: 0.7, blue: 0.3, alpha: 1.0))
        
        redButton.setTitleColor(.white, for: .normal)
        blueButton.setTitleColor(.white, for: .normal)
        greenButton.setTitleColor(.white, for: .normal)

        let stackView = UIStackView(arrangedSubviews: [
            redButton,
            blueButton,
            greenButton
        ])

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 40
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -40
            )
        ])
    }

    func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)

        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        button.clipsToBounds = true

        button.addTarget(
            self,
            action: #selector(colorButtonTapped(_:)),
            for: .touchUpInside
        )

        return button
    }
    
    @objc func colorButtonTapped(_ sender: UIButton) {

        guard let selectedColor = sender.backgroundColor else {
            return
        }

        // Send the selected color to Screen 1
        delegate?.didSelectColor(selectedColor)

        // Navigate back to Screen 1
        dismiss(animated: true)

    }
}

#Preview {
    ColorPickerViewController()
}
