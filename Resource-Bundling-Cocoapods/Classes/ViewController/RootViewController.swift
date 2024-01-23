import Foundation
import SnapKit
import UIKit

public class RootViewController: UIViewController {

    private var languageSwitch = UISwitch()

    private var languageLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        return label
    }()

    private var clickMe: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 16
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        return button
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupEvents()
    }

    private func setupViews() {
        Localization.shared.setup(lang: "id")
        
        view.addSubview(languageLabel)
        view.addSubview(languageSwitch)
        view.addSubview(clickMe)

        languageSwitch.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
        }

        languageLabel.snp.makeConstraints { make in
            make.trailing.equalTo(languageSwitch.snp.leading).offset(-8)
            make.centerY.equalTo(languageSwitch.snp.centerY)
        }

        clickMe.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }

    private func setupEvents() {
        languageSwitch.isOn = false
        languageSwitch.addTarget(self, action: #selector(languageSwitchToggled), for: .valueChanged)
        clickMe.addTarget(self, action: #selector(clickMeTapped), for: .touchUpInside)
    }

    @objc func clickMeTapped() {
        navigationController?.pushViewController(GreetingsViewController(), animated: true)
    }

    @objc func languageSwitchToggled() {
        if languageSwitch.isOn {
            languageLabel.text = "EN"
            Localization.shared.setup(lang: "en")
        } else {
            languageLabel.text = "ID"
            Localization.shared.setup(lang: "id")
        }
    }
}

