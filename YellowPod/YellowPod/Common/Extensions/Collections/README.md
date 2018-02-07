# Collections

When working with UICollectionView and UITableView controllers, put your string identifiers inside the [CollectionsIdentifiers](./Collections/CollectionsIdentifiers.swift) file.

This extension folder gives you helper methods to only work with identifiers already defined:

* dequeue
* register

This methods are available as UICollectionView and UITableView extensions.

After add your identifier inside [CollectionsIdentifiers](./Collections/CollectionsIdentifiers.swift) and under the proper `enum`, you need to:

1. Register the cell identifier

```swift
@IBOutlet weak var collectionView: UICollectionView! {
    didSet {
        collectionView.registerCell(.MyCustomViewCellIdentifier)
    }
}
```

2. Dequeue the cell with the helper method inside the `cellForItemAt` method

```swift
let cell = collectionView.dequeue(.MyCustomViewCellIdentifier, for: indexPath, castingTo: MyCustomViewCell.self)
```