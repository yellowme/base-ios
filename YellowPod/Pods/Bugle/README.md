# Bugle

[![Version](https://img.shields.io/cocoapods/v/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)
[![License](https://img.shields.io/cocoapods/l/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)
[![Platform](https://img.shields.io/cocoapods/p/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)

Bugle, is a helper for displaying alerts without writing boilerplate code.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To give `Bugle` a try with an example project, run the following command:

```bash
$ pod try Bugle
```

To integrate `Bugle` into your Xcode project, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'Bugle'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

Setup, the  `shared` instance of `Bugle` inside your `AppDelegate.swift` add:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    ...

    Bugle.setup(with: options)
    
    ...
    return true
}
```

Where `options` is a configuration struct:

```swift
extension AppDelegate {
    fileprivate var options: BugleOptions {
        return BugleOptions(
            tintColor: .customColor,
            cancelMessage: "No, forget it",
            commonTitle: String.myAppTitle,
            commonAction: "Understood",
            errorTintColor: .customRedOne
        )
    }
}
```

Also, If you want to liste to actions on the dialog just add the `BugleDelegate`:

```swift
extension ViewController: BugleDelegate {
    func didConfirm() {
        debugPrint("Confirm bugle")
    }
    
    // This method is optional
    func didCancel() {
        //TODO: Do something
    }
}
```

Then:

```swift
Bugle.shared.play("Hello World", on: self)
```

or you can override some setup:

```swift
Bugle.shared.play("Are you sure?", "Push to master", "Yes, I'm a savage", true, self, on: self, type: .risky)
```

## Author

[Luis Burgos](lhttps://github.com/LuisBurgos/) - [Email me](uisarturo.burgos@gmail.com)

## License

Bugle is released under the MIT license. See [LICENSE](https://github.com/nmdias/DefaultsKit/blob/master/LICENSE) for details.
