import UIKit

public enum FontType: String, CaseIterable {
    case poppinsBold = "Poppins-Bold"
    case poppinsRegular = "Poppins-Regular"
    
    var fileNameAndExtension: (String, String) {
        (rawValue, "ttf")
    }

    var ttfExtension: String {
        return "ttf"
    }
}

public struct Font: Equatable {
    public let uiFont: UIFont
    public let fontType: FontType
    public let fontSize: CGFloat

    public init(type: FontType, size: CGFloat) {
        fontType = type
        fontSize = size
        uiFont = Self.loadFont(fontType: type, size: size, fallback: .systemFont(ofSize: size))
    }

    private static func loadFont(fontType: FontType, size: CGFloat, fallback: UIFont) -> UIFont {
        let fontProvider: () -> UIFont? = { UIFont(name: fontType.rawValue, size: size) }

        if let font = fontProvider() {
            return font
        }

        FontType.allCases.forEach { font in
            guard registerFont(fileName: font.rawValue, fileExtension: fontType.ttfExtension) else {
                assertionFailure("Cannot load font file \(font.rawValue).\(fontType.ttfExtension)")
                return
            }
        }
        return fontProvider() ?? fallback
    }

    private static func registerFont(fileName: String, fileExtension: String) -> Bool {
        let bundle = ResourceBundle.bundle
        let fontBundlePath = "Fonts/" + fileName

        guard let url = bundle.url(forResource: fontBundlePath, withExtension: fileExtension),
              let dataProvider = CGDataProvider(url: url as CFURL),
              let font = CGFont(dataProvider)
        else {
            return false
        }
        var error: Unmanaged<CFError>?
        return CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

