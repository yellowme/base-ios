# Geocode

Provide a way to build an `address` string by using `reverse gecoding`.

```swift
/**
In order to display an address for a given location we use
reverse geocoding provided by apple to build a string address
*/
func updatePlaceBySearching(for location: CLLocationCoordinate2D) {
  geoCoder?.cancelGeocode()  
  let location = CLLocation(latitude: location.latitude, longitude: location.longitude)

  // You could toggle view state flag for loading

  geoCoder?.saveReverseGeocodeLocation(
    location,
    preferredLocale: Locale.init(identifier: "es"),
    completionHandler: { (placemarks, error) -> Void in
      //Handle response
      guard let marks = placemarks, !marks.isEmpty else {
        debugPrint("No places for location")
        return
      }

      // Handle success on reveser geocode
      let address = marks[0].buildAddress()
      debugPrint("Address for new point is \(address)")

      // You could toggle view state flag for loading
  })
}
```