protocol Conference {
  func foo()
}

extension Conference {
  func foo() { print("Conference foo") }
  func goo() { print("Conference goo") }
}

struct SwiftHeroes: Conference {
  func foo() { print("SwiftHeroes foo") }
  func goo() { print("SwiftHeroes goo") }
}

let swiftHeroes: Conference = SwiftHeroes()
swiftHeroes.foo()
swiftHeroes.goo()