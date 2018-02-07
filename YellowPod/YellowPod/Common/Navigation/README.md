# Navigation

## 1. Define all your navigation concerns inside [Navigator+Captain](/Navigator+Captain.swift)

Here you need to add any identifier for:

* Segues
* Controllers
* UIViewControllers

## 2. Define complex flows inside `getTransition()` method on [Flows](/Navigator+Transition) class

## 3. Use the methods [setMainFlow()](./Navigator+Transition.swift) or [execute](./NavigationHelper+Transition.swift)