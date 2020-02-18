# Fluent Interface

流式接口(Fluent interface) 是一種快速賦予物件指定屬性的 Swift 通用性功能。這個 Package 受到 [Hsu Li-Heng](https://lihenghsu.com/) 所筆的 [利用 Swift 5.1 新功能實作 Fluent Interface　讓程式碼更易讀流暢！](https://www.appcoda.com.tw/fluent-interface/)啟發。 

![Swift](https://github.com/ytyubox/fluentinterface/workflows/Swift/badge.svg) [![codecov](https://codecov.io/gh/ytyubox/fluentinterface/branch/master/graph/badge.svg)](https://codecov.io/gh/ytyubox/fluentinterface) [![Platform](https://img.shields.io/badge/platform-macos%20%7C%20ios%20%7C%20watchos%20%7C%20ipados%20%7C%20tvos-lightgrey)](https://github.com/ytyubox/Weak) [![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org) [![Xcode](https://img.shields.io/badge/Xcode-11-blue.svg)](https://developer.apple.com/xcode) [![SPM](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager) [![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)


## fluent interface 的概念
fluent interface 是物件導向API的一種廣泛運用鏈式調用(method chaining)的API設計，目的在於提供更為可讀的程式碼。最早由 Eric Evans 與 Martin Fowler於2005年提出。

## Fluent Interface 的設計

fluent interface 主要使用方法瀑布調用(method cascading)，又名鏈式調用，具體方法是使每個 method 具有 `return self`。更抽像地說，fluent interface 通過上下文在鏈式調用中繼後續的 method，其中通常上下文是：

1. 透過前文的 `return value`決定。
2. 使用 `return self`，則上下文為同一物件。
3. 由 `return Void` 作為鏈式終點。

必須強調 fluent interface，並不只是連續調用 method，
 it entails designing an interface that reads like a Domain-specific language(DSL), using other techniques like "nested functions and object scoping"

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
