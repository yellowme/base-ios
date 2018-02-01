# Domain

## Constants

## Models

Each model should subscribe to the `APIModel` protocol when working with client-server application. Example:

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

