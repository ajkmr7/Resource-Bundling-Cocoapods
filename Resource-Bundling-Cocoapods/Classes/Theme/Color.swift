import UIKit

struct Color: Equatable {
    private let palette: ColorPalette
    private let alpha: CGFloat

    init(palette: ColorPalette, alpha: CGFloat = 1.0) {
        self.palette = palette
        self.alpha = alpha
    }

    var uiColor: UIColor { palette.uiColor.withAlphaComponent(alpha) }
}

enum ColorPalette: String, CaseIterable, Equatable, NameableAsset {
    case white
    case black

    var uiColor: UIColor { UIColor(self) }
}

