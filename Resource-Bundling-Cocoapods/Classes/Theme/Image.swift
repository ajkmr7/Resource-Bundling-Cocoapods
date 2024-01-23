enum Image: String, CaseIterable, NameableAsset {
    case backButton = "back_button"

    var uiImage: UIImage { UIImage(self, resourceBundle: ResourceBundle.bundle) }
}
