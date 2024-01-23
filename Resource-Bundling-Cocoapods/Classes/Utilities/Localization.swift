import Foundation

enum LocalizableStrings: String, CaseIterable {
    case greeting = "package.feature_greeting"
    
    var value: String {
        return Localization.shared.localizedWithKey(rawValue) ?? rawValue.localized()
    }
}

public class Localization {
    public static let shared = Localization()

    private var language: String?
    var translations: [String: Any]?

    public func setup(lang: String, translations: [String: Any]? = nil) {
        Localization.shared.language = lang
        Localization.shared.translations = translations
    }

    public func getLanguage() -> String {
        return language ?? "id"
    }

    func localizedWithKey(_ key: String) -> String? {
        return translations?[key] as? String
    }
}

extension String {
    func localized() -> String {
        localized(use: ResourceBundle.bundle, appLanguage: Localization.shared.getLanguage())
    }

    private func localized(
        use bundle: Bundle,
        appLanguage: String
    ) -> String {
        guard let bundle = Bundle.localizedBundle(
            withLanguage: appLanguage,
            use: bundle
        ) else {
            fatalError("Language bundle is not found")
        }

        return NSLocalizedString(
            self,
            bundle: bundle,
            comment: ""
        )
    }
}

private extension Bundle {
    static func localizedBundle(
        withLanguage appLanguage: String,
        use bundle: Bundle
    ) -> Bundle? {
        guard let path = bundle.path(forResource: "Localization/" + appLanguage, ofType: "lproj") else {
            return nil
        }

        return Bundle(path: path)
    }
}
