# How to Create a Manager

## 1. Identifiy the API resource your working with

This could be any domain model, like `User`, `Todo`, `Book`, `Repository`, etc..

**IMPORTANT:** Your model MUST adopt `Codable` protocol. We are using [DefaultsKit](https://github.com/nmdias/DefaultsKit) to easily store *Codable models.*

## 2. Create the Manager

Inside the file [Managers](./Managers/Managers.swift) create class which inherits from `DefaultsManager` and override the method `keyString` as follows:

```swift
class UserManager: DefaultsManager<User> {
    override func keyString() -> String {
        return "currentUser"
    }
}
```

## 3. Create the MOCK

Inside the folder [Mocks](./Mocks) create a new Swift file with `fake` implementation for the recently created manager. This is a good practice for `testing` or `debugging`.

Example:

```swift
class MockUserManager: DefaultsManager<User> {
    override func keyString() -> String {
        return "mockUser"
    }

    override func save(data: User?) {
        //TODO: Modify if needed
    }

    override func retrieve() -> User? {
        return MockHelper.getUserMock()
    }

    override func clear() {
        //TODO: Modify if needed
    }
}
```