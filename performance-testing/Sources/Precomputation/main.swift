protocol Operation {
  func perform(_ val: Int) -> Int
}

extension Operation {
  func perform(_ val: Int) -> Int { val + val }
}

struct Sum: Operation {
  func perform(_ val: Int) -> Int { val + val }
}

let structTime = timeOfRun {
  for num in 0..<100000 {
    let operation = Sum()
    _ = operation.perform(num)
  }
}

let protocolTime = timeOfRun {
  for num in 0..<100000 {
    let operation: Operation = Sum()
    _ = operation.perform(num)
  }
}

print("\(protocolTime.formatted)s")
print("\(structTime.formatted)s")
print("Protocol's extension function is \((structTime / protocolTime)) times faster than accessed by protocol interface")

func timeOfRun(_ function: () -> ()) -> Double {
  let timeBefore = CACurrentMediaTime()
  function()
  return CACurrentMediaTime() - timeBefore
}

extension Double {
  var formatted: String {
    String(format: "%.20f", self)
  }
}

import Foundation
import QuartzCore
