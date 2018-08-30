# How to Create an API client

*Notes:* 

* Before start follow the indications for our [Domain](https://github.com/yellowme/base-ios/tree/master/YellowPod/YellowPod/Domain) layer.
* Don't forget to add a `key-value` inside your `Info.plist` and `.xcconfig` files. We use a base URL value reference inside the [APIConstants](https://github.com/yellowme/base-ios/blob/master/YellowPod/YellowPod/Data/Remote/API.swift) class. We recommend to use `CoreAPIURL` as key for your *plist* file.

## 1. Identifiy the API resource your working with

This could be any domain model, like `User`, `Todo`, `Book`, `Repository`, etc..

## 2. Create the Endpoints

Inside the file [API+Endpoints](./API+Endpoints.swift) locate the `Endpoints` enum and add your `RemoteResource` enum definition. For example:

```swift
enum Endpoints {
    enum Users: RemoteResource {
        case find
        case update
        case create
        case authenticate
        
        var endpoint: String {
            switch self {
            case .authenticate:
                return "\(url)authenticate/"
            default:
                return url
            }
        }
        
        var url: String {
            return  "\(APIConstants.apiBaseURL)/users/"
        }
    }

    enum Notifications: RemoteResource {
        case find(id: String)
        case delete(id: String)
        case deleteAll
        case list
        
        var endpoint: String {
            switch self {
            case .find(let id), .delete(let id):
                return "\(url)\(id)/"
            default:
                return url
            }
        }
        
        var url: String {
            return  "\(APIConstants.apiBaseURL)/notifications/"
        }
    }
    
    // HERE: Add your custom endpoints
}
```

## 3. Create the Protocol

Inside the folder [Protocols](./Protocols) create a new Swift file in which your going to define the protocol for your service. For example:

```swift
protocol UsersAPIProtocol: RemoteDataSource {
    func getCurrent(completion: @escaping (User?, String?) -> Void)
}
```

## 4. Create the Router

Inside the folder [Routers](./Routers) create a new Swift file which subscribes to the protocol created on `Step 3`. 
Here your going to use the keys added on the `Step 1`.

```swift
enum UsersRouter: AuthenticatedRouter {
    case current
    case create(Parameters)
    case update(Parameters)
    case login(Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .current:
            return .get
        case .create:
            return .post
        case .update(_):
            return .put
        case .login(_):
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .current:
            return Endpoints.Users.find.url
        case .create:
            return Endpoints.Users.create.url
        case .update(_):
            return Endpoints.Users.update.url
        case .login(_):
            return Endpoints.Users.authenticate.url
        }
    }
    
    // MARK: Add body or query params
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

## 5. Create the `Service` class

```swift
import Foundation
import Alamofire

class UsersAPI: UsersAPIProtocol {
    func getCurrent(completion: @escaping (User?, String?) -> Void) {
        let request = ServerRequest<User>(endPoint: UsersRouter.current) { user, error in
            guard error == nil else {
                completion(nil, error?.localizedDescription ?? "Error has ocurred")
                return
            }
            debugPrint(user ?? "No user")
            completion(user, nil)
        }
        
        serverRequest(request)
    }
}
```

**Important:** Use the `serverRequest` method and remember to import `Alamofire`.

## 6. Create the MOCK

Inside the folder [Mocks](./Mocks) create a new Swift file with `fake` implementation for the recently created service. This is a good practice for `testing` or `debugging`.
