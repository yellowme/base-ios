# Data

## Remote

**IMPORTANT:** `Remote` folder uses:

* `API.swift` file to define API constatns like keys for headers or the base URL for all the requests.
* `API+Endpoints.swift` file to define all `Endpoints` inside a common enumrator to keep API access definition in one file.

### Folder structure

* **Errors** - Custom horror handling
* **Mocks** - Fake server responses for testing or debugging
* **Protocols** - Abstract definition of server data access
* **Services** - Concrete implementations for all server requests
* **Routers** - Endpoints and concrete server resources access
* **Support** - Hooks and base behaviors already implemented for you to have out of the box funcionality
  * Base routers hooks
  * **RemoteDataSource** - Simplify Alamofire requests.

## Local

### Folder structure

* **Managers** - Concrete implementations for all local data access (UserDefaults)
* **Mock** - Fake local responses for testing or debugging
