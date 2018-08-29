# Helpers

## InfoPlistHelper

### 1. Define your keys inside [InfoPlistKey](./InfoPlistHelper.swift)

Use the following nomenclature:

* GoogleMapsAPIKey
* CoreAPIURL

### 2. Add a key-value inside your Info.plist file

```plist
<key>CoreAPIURL</key>
<string>$(CORE_API_URL)</string>
```

*Note:* Also, as the example above demonstrates, you could use a `.xcconfig` file to define environment/target variables.

### 3. Use the `lookUpFor(_ key: InfoPlistKey)` to access the variable on runtime

## Device Detection

* [ScreenSize](./DeviceDetection.swift)
* [DeviceType](./DeviceDetection.swift)