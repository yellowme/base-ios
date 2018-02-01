# ViewPresenter

After several projects using it we are developing a set of `hooks` to avoid code duplication. `Model-View-Presenter` architecture is a way to separete view and logic responsabilities, it also allows to work with `mocks` when we are testing.

## View

Features encapsulated by the `BaseViewController` class:

* Display a loading view among all the children controllers.
* Provide access to `BaseView` methods such as `setProgress` and  `display`

You only need to extend from the base class:

```swift
import UIKit

class MyViewController: BaseViewController {
  ...
}
```

If you want a custom behavior for the loading indicator, you could do something like this:

```swift
import UIKit

class MyCustomBaseController: BaseViewController, IndicatorDecorator {
    var indicatorColor: UIColor = .warmBlue
}
```

Now with this approach you need to extend from `MyCustomBaseController` instead of `BaseViewController`.

## Presenter

For this part you only need to subscribe to the protocol `PresenterMate`:

```swift
class MyViewController: WawaBaseController, PresenterMate {
  var presenter: MyViewPresenter!
}
```