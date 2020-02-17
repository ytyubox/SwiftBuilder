# fluentinterface

Fluent interface is a fast way to assign new value to the property  of the object. 

![Swift](https://github.com/ytyubox/fluentinterface/workflows/Swift/badge.svg)
[![codecov](https://codecov.io/gh/ytyubox/fluentinterface/branch/master/graph/badge.svg)](https://codecov.io/gh/ytyubox/fluentinterface)
[![Platform](https://img.shields.io/badge/platform-macos%20%7C%20ios%20%7C%20watchos%20%7C%20ipados%20%7C%20tvos-lightgrey)](https://github.com/ytyubox/Weak)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-11-blue.svg)](https://developer.apple.com/xcode)
[![SPM](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager)
[![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)

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

2. Import the Weak module.

    ```swift
    import FluentInterface
	let point = CGPoint()+
				.x(1)
				.y(2)-
    
    ```

## Contribute

Working on your first Pull Request? You can learn how from this *free* series, [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github).
