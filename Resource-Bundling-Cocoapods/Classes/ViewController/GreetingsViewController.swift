import Foundation
import SnapKit
import UIKit

public class GreetingsViewController: UIViewController, UIGestureRecognizerDelegate {

    private var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableStrings.greeting.value
        label.textColor = Color(palette: .black).uiColor
        return label
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = Color(palette: .white).uiColor
    
        let backBTN = UIBarButtonItem(image: Image.backButton.uiImage,
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        
        view.addSubview(greetingLabel)

        greetingLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}

