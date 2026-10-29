
import UIKit

class ViewController: UIViewController, ColorSelectionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Home"

        // Create a button to open Screen 2
        let chooseColorButton = UIButton(type: .system)

        chooseColorButton.setTitle(
            "Choose Background Color",
            for: .normal
        )

        chooseColorButton.setTitleColor(.white, for: .normal)
        chooseColorButton.backgroundColor = .darkGray
        chooseColorButton.layer.cornerRadius = 12

        chooseColorButton.addTarget(
            self,
            action: #selector(openColorScreen),
            for: .touchUpInside
        )

        chooseColorButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chooseColorButton)

        NSLayoutConstraint.activate([
            chooseColorButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            chooseColorButton.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            chooseColorButton.widthAnchor.constraint(
                equalToConstant: 240
            ),
            chooseColorButton.heightAnchor.constraint(
                equalToConstant: 55
            )
        ])
    }

    // Open Screen 2
    @objc func openColorScreen() {
        let colorVC = ColorPickerViewController()
        colorVC.delegate = self
        colorVC.modalPresentationStyle = .fullScreen

        present(colorVC, animated: true)
    }

    // Implement the protocol method
    func didSelectColor(_ color: UIColor) {

        view.backgroundColor = color
    }
}
