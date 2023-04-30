protocol Swimmer {
  func swim()
}

struct Duck: Swimmer {
  func swim() {}
}

struct Fish: Swimmer {
  func swim() {}
}

let swimmers: [Swimmer] = [Duck(), Duck(), Fish()]
