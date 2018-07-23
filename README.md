# E2

E2 is Event Emitter library in Swift.

## Requirements
- Swift 4.2
- iOS 8.0 or later

## Installation

### Carthage

* Cartfile

```Cartfile
github "keygx/E2"
```
or

```Cartfile
github "keygx/E2" "branch-name"
```
or

```Cartfile
github "keygx/E2" "tag"
```

* install

```
$ carthage update
```
To integrate "E2.framework" into your Xcode project

## Usage

```
// define name
struct EventName {
    static let Foo = E2.Name("e2_Foo")
}
```

```
// event handler
let handler = { (response: E2.Response) in
    switch(response.result) {
    case .success:
        print("success:\n \(response.data)")
    case .failure:
        print("error:\n \(response.data)")
    }
}

// add event
E2.add(queue: .main, name: EventName.Foo, handler: handler)
```

```
// callback success
E2.callback(E2.Response(result: .success, data: data), name: EventName.Foo)

// callback failure
E2.callback(E2.Response(result: .failure, data: error), name: EventName.Foo)
```


## License

E2 is released under the MIT license. See LICENSE for details.

## Author

Yukihiko Kagiyama (keygx) <https://twitter.com/keygx>
