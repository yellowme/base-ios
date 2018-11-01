# Domain

## Constants

## Models

Each model should subscribe to the `Codable` protocol when working with client-server application. Then you need to define a set of coding keys as a private enum:

```swift
struct YourDomainModel: Codable {
    //HERE add your model attributes

    private enum CodingKeys: CodingKey {
      //HERE add your attributes keys
    }
}
```

For more information about `CodingKeys` please read [Apple Documentation](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)

Example:

```swift
import Foundation

struct Pokemon: Codable {
    var id: String?
    var types: [String]?
    var region: String?
    var generation: String?
    var imageURL: String?
    var name: String?

    private enum CodingKeys: CodingKey {
        case id
        case types
        case region
        case generation
        case imageURL
        case name
    }
}
```
