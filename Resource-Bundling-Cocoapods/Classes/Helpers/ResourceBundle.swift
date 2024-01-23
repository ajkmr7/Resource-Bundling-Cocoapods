import Foundation

final class ResourceBundle {
    static let bundle: Bundle = {
        let myBundle = Bundle(for: ResourceBundle.self)

        guard let bundleURL = myBundle.url(
            forResource: "Custom-Pod-Resources", withExtension: "bundle"
        )
        else { fatalError("Custom-Pod-Resources.bundle not found!") }

        guard let bundle = Bundle(url: bundleURL)
        else { fatalError("Cannot access Custom-Pod-Resources.bundle!") }

        return bundle
    }()
}
