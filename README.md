# Octopus

![Swift: 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg)
![OS: Linux](https://img.shields.io/badge/OS-Linux-brightgreen.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)

This package provides common functionality which
can be useful when communicating with any module of
the [Octopus](https://github.com/delamonpansie/octopus).

No networking abilities included.
For Octopus' client see [IProto](https://github.com/my-mail-ru/swift-IProto).

# Requirements

* Swift 3.0 Preview 6
* [libiprotocluster](https://github.com/my-mail-ru/libiprotocluster)

# Types

## OctopusError

An abstraction for all common error codes used by Octopus' core.
See [Error.swift](Sources/Octopus/Error.swift) for possible values.
