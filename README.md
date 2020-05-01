## About ComposableLayout
This tiny framework helps you to make complex layout with own dedicated controllers. It's inspired by Apple's ComposableLayout framework but this framework supports iOS 9+ devices.

## Install

### CocoaPods

```ruby
pod 'ComposableLayout'
```

### Carthage
```ruby
github "serhatsezer/ComposableLayout"
```

### Manual
Just drag and drop the ComposableLayout folder into your project and that's it! 

## Example
You can check example folder or directly run the xcode project!
```swift
let composableView = ComposableLayoutView(frame: view.bounds)
composableView.embed(in: self, viewControllers: [ItemsListScrollableViewController(),
                                                 OnboardViewController(),
                                                 ItemsListScrollableViewController(),
                                                 OnboardViewController(),
                                                 ItemsListScrollableViewController(),
                                                 OnboardViewController(),
                                                 ItemsListScrollableViewController()])
```

## Contact me

* Twitter: @serhatsezer
