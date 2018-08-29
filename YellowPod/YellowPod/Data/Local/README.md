# How to Create a Manager

## 1. Identifiy the API resource your working with

This could be any domain model, like `User`, `Todo`, `Book`, `Repository`, etc..

## 2. Add your model keys

Locate the file [LocalKeys](./Support/LocalKeys.swift) and add an `enum` class inside the `LocalKeys` class:

```swift
enum LocalKeys {
    enum User: String {
        case current = "user-current"
    }

    enum Token: String {
        case authToken = "token-auth"
    }

    //HERE: Add your custom keys
}

```

## 3. Create the Protocol

Inside the folder [Protocols](./Protocols) create a new Swift file in which your going to define the protocol for your manager. For example:

```swift
protocol UserManagerProtocol {
    func save(user: User?)
    func retrieve() -> User?
    func clear()
}
```

## 4. Create the Manager

Inside the folder [Managers](./Managers) create a new Swift file which subscribes to the protocol created on `Step 3`. 
Here your going to use the keys added on the `Step 1`.

```swift
class UserManager: UserManagerProtocol {
    func save(user: User?) {

    }

    func retrieve() -> User? {
        return nil
    }

    func clear() {

    }
}
```

Alternatively, you could use `DefaultsKit` pod dependency to easily implement *UserDefaults* access:

```swift
import DefaultsKit

class TokenManager: TokenManagerProtocol {
    static let tokenKey = Key<String>(LocalKeys.Token.authToken.rawValue)
    let defaults = Defaults()

    func save(data: String?) {
        if let data = data {
            defaults.set(data, for: TokenManager.tokenKey)
        }
    }

    func retrieve() -> String? {
        return defaults.get(for: TokenManager.tokenKey)
    }

    func clear() {
        defaults.clear(TokenManager.tokenKey)
    }
}
```

*Note:* Remember to import `DefaultsKit`.

## 5. Create the MOCK

Inside the folder [Mocks](./Mocks) create a new Swift file with `fake` implementation for the recently created manager. This is a good practice for `testing` or `debugging`.