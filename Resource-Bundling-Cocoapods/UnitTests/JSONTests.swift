import XCTest
@testable import Resource_Bundling_Cocoapods

struct Person: Encodable, Decodable {
    let name: String
    let age: Int
    let role: String
}

class JSONTests: XCTestCase {

    func testSampleJSON() {
        
        guard let person: Person = FileHandler.readLocalJSONFile(
            Person.self,
            file: File(
                name: "sample",
                groupName: "JSON",
                bundle: ResourceBundle.bundle,
                type: "json"
            )
        ) else {
            fatalError("Failed to parse mock JSON file")
        }

        XCTAssertEqual(person.name, "Ajay")
        XCTAssertEqual(person.age, 22)
        XCTAssertEqual(person.role, "Mobile Developer")
    }
}

