# ComposableLayout

[![CI Status](https://img.shields.io/travis/serhatsezer/composablelayout.svg?style=flat)](https://travis-ci.org/serhatsezer/composablelayout)
[![Version](https://img.shields.io/cocoapods/v/composablelayout.svg?style=flat)](https://cocoapods.org/pods/composablelayout)
[![License](https://img.shields.io/cocoapods/l/composablelayout.svg?style=flat)](https://cocoapods.org/pods/composablelayout)
[![Platform](https://img.shields.io/cocoapods/p/composablelayout.svg?style=flat)](https://cocoapods.org/pods/composablelayout)

ComposableLayout let you to make complex layouts with their own view controllers and their life cycles! It uses UIScrollView in order to make contents horizontally scrollable. 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
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

## Requirements

## Installation

ComposableLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'composablelayout'
```

## ToDos

- [ ] Supporting removing content from the list
- [ ] Supporting horizontal scrolling
- [ ] Adding Carthage support
- [ ] Auto resizing scroll view based on content
- [ ] Add more examples and screenshots

## Author

Serhat Sezer, @serhatsezer

## License

composablelayout is available under the MIT license. See the LICENSE file for more info.
