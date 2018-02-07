# Domain

## Constants

## Models

Each model should subscribe to the `APIModel` protocol when working with client-server application. Then you need to implement the `init(json: JSON)` method. You could achieve this by using an extension:

```swift
extension YourDomainModel: APIModel {
    init(json: JSON) throws {
        //HERE: - Map all variables. Go to "Networking+Keys" and define all your keys

        //HERE: - 1. Validate keys you want
        //try json.guarantee(hasKeys: .id, .name)

        //HERE: - 2. Obtain values from keys
        //guard let id = json.parse(.id).string else { throw Keys.id }
        //guard let name = json.parse(.name).string else { throw Keys.name }

        //HERE: - 3. Assign the parsed values
        //self.id = id
        //self.name = name
    }
}
```

Example:

```swift
import Foundation
import SwiftyJSON

struct Session {
  let token: String
  let userId: String
}

extension Session: APIModel {
  init(json: JSON) throws {
    try json.guarantee(hasKeys: .token, .userId)

    guard let token = json.parse(.token).string else { throw Keys.token }
    guard let userId = json.parse(.userId).string else { throw Keys.userId }

    self.token = token
    self.userId = userId
  }
}
```

