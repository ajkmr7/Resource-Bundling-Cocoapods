import Foundation

public struct File {
    let name: String
    let groupName: String?
    let bundle: Bundle
    let type: String
}

public enum FileHandler {
    static func readLocalJSONFile<T: Codable>(_: T.Type, file: File) -> T? {
        do {
            var jsonBundlePath = ""
            if let group = file.groupName, !group.isEmpty {
                jsonBundlePath = "\(group)/" + file.name
            } else {
                jsonBundlePath = file.name
            }

            if let filePath = file.bundle.path(
                forResource: jsonBundlePath,
                ofType: file.type
            ) {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                do {
                    let decodeResponse = try JSONDecoder().decode(T.self, from: data)
                    return decodeResponse
                } catch {
                    debugPrint("error: \(error)")
                }
            } else {
                debugPrint("Invalid filepath")
            }
        } catch {
            debugPrint("error: \(error)")
        }
        return nil
    }
}
