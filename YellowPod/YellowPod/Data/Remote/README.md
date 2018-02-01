# How to Create an API client

## 1. Identifiy the API resource your working with

This could be any domain model, like `User`, `Todo`, `Book`, `Repository`, etc..

## 2. Add your model keys

Locate the file [RemoteKeys](./Support/RemoteKeys.swift) and add a `case` inside the RemoteKeys `enum`

```swift
enum RemoteKeys: String {
    case password = "password"
    case email = "email"
    case id = "id"
    case data = "data"

    ...
}
```

## 3. Create the Endpoints

Inside the file [API+Endpoints](./API+Endpoints.swift) locate the `Endpoints` enum and add your `RemoteResource` enum definition. For example:

```swift
enum Endpoints {
    enum Users: RemoteResource {
        case find(userId: String)
        case all
        case create

        var endpoint: String {
            switch self {
            case .find(let userId):
                return "\(url)\(userId)"
            case .all:
                return url
            case .create:
                return url
            }
        }

        var url: String {
            return  "\(APIConstants.apiBaseURL)/user/"
        }
    }

    // HERE: Add your custom endpoints
}
```

## 4. Create the Protocol

Inside the folder [Protocols](./Protocols) create a new Swift file in which your going to define the protocol for your service. For example:

```swift
protocol UsersAPIProtocol: RemoteDataSource {
    func getCurrent(completion: @escaping (User?, String?) -> Void)
}
```

## 5. Create the Router

Inside the folder [Routers](./Routers) create a new Swift file which subscribes to the protocol created on `Step 3`. 
Here your going to use the keys added on the `Step 1`.

```swift
enum UsersRouter: AuthenticatedRouter {
    case current
    case create(Parameters)

    var method: HTTPMethod {
        switch self {
        case .current:
            return .get
        case .create:
            return .post
        }
    }

    var path: String {
        switch self {
        case .current:
            return Endpoints.Users.all.url // TODO: Customize
        case .create:
            return Endpoints.Users.all.url
        }
    }

    // MARK: Customize Request
    func decorate(_ urlRequest: inout URLRequest) throws -> URLRequest {
        switch self {
        case .create(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        return urlRequest
    }
}
```

## 6. Create the `Service` class

```swift
import Foundation
import Alamofire

class UsersAPI: UsersAPIProtocol {
    func getCurrent(completion: @escaping (User?, String?) -> Void) {
        self.serverRequest(UsersRouter.current, UserParser()) { (user, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            debugPrint(user ?? "No user")
            completion((user as? [User])?.first, nil)
        }
    }
}
```

**Important:** Use the `serverRequest` method and remember to import `Alamofire`.

## 7. Create the MOCK

Inside the folder [Mocks](./Mocks) create a new Swift file with `fake` implementation for the recently created service. This is a good practice for `testing` or `debugging`.