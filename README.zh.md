# Fluent Interface

Fluent interface is a fast way to assign new value to the property  of the object. Thanks to [Hsu Li-Heng](https://lihenghsu.com/) and his great article [利用 Swift 5.1 新功能實作 Fluent Interface　讓程式碼更易讀流暢！](https://www.appcoda.com.tw/fluent-interface/). 

![Swift](https://github.com/ytyubox/fluentinterface/workflows/Swift/badge.svg) [![codecov](https://codecov.io/gh/ytyubox/fluentinterface/branch/master/graph/badge.svg)](https://codecov.io/gh/ytyubox/fluentinterface) [![Platform](https://img.shields.io/badge/platform-macos%20%7C%20ios%20%7C%20watchos%20%7C%20ipados%20%7C%20tvos-lightgrey)](https://github.com/ytyubox/Weak) [![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org) [![Xcode](https://img.shields.io/badge/Xcode-11-blue.svg)](https://developer.apple.com/xcode) [![SPM](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager) [![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)


## Key Concept of Fluent Interface
A fluent interface is a method for designing object-oriented APIs that relies extensively on method chaining.  Its goal is to increase code legibility by creating a domain-specific language. It was coined in 2005 by Eric Evans and Martin Fowler.

## Designing a Fluent Interface

A fluent interface is implemented by using method chaining to implement method cascading, concretely by having each method return self. Stated more abstractly, a fluent interface relays the instruction context of a subsequent call in method chaining, where generally the context is

1. Defined through the return value of a called method
2. Self-referential, where the new context is equivalent to the last context
3. Terminated through the return of a void context

Note that a "fluent interface" means more than just method cascading via chaining; it entails designing an interface that reads like a Domain-specific language(DSL), using other techniques like "nested functions and object scoping"

## Before swift 5.1

In Swift 3.0+, returning self in the functions is one way to implement the fluent pattern.
```swift
class Person {
    var firstname: String = ""
    var lastname: String = ""
    var favoriteQuote: String = ""

    @discardableResult
    func set(firstname: String) -> Self {
        self.firstname = firstname
        return self
    }

    @discardableResult
    func set(lastname: String) -> Self {
        self.lastname = lastname
        return self
    }

    @discardableResult
    func set(favoriteQuote: String) -> Self {
        self.favoriteQuote = favoriteQuote
        return self
    }
}


let person = Person()
    .set(firstname: "John")
    .set(lastname: "Doe")
    .set(favoriteQuote: "I like turtles")
```

## In Swift 5.1

By the power of Dynamic Member Lookup in Swift 4.2, and it's followed up evolve feature, Key Path Member Lookup in Swift 5.1 we can acheive Fluent Interface, by the article of Hsu Li-Heng: [[利用 Swift 5.1 新功能實作 Fluent Interface　讓程式碼更易讀流暢！]](https://www.appcoda.com.tw/fluent-interface/). I Highly recommend reading through.


## How to use

```swift
import FluentInterface
struct Point {
    var x:Int
    var y:Int
    init(x:Int = 0, y:Int = 0) {
        self.x = x
        self.y = y
    }
}

let point = Point()+
              .x(1)
              .y(2)-
// point now have x:1 and y: 2
```

## Requirements

* Swift 5.1


## Installatio Using Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a decentralized dependency manager for Swift.

1. Add the project to your `Package.swift`.

    ```swift
    import PackageDescription

    let package = Package(
        ...
        dependencies: [
          ...
            .Package(url: "https://github.com/ytyubox/fluentinterface", from: "1.0.0"),
        ],
        targets: [
        .target(
            name: "...",
            dependencies: ["FluentInterface"])
    )
    ```

## Contribute

Working on your first Pull Request? You can learn how from this *free* series, [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github).
