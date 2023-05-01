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

print("Struct calls took   \(structTime.formatted)s")
print("Protocol calls took \(protocolTime.formatted)s")
print("Protocol's extension function is \((structTime / protocolTime)) times faster than accessed by protocol interface\n")

func timeOfRun(_ function: () -> ()) -> Double {
  let timeBefore = CACurrentMediaTime()
  function()
  return CACurrentMediaTime() - timeBefore
}

extension Double {
  var formatted: String {
    String(format: "%.10f", self)
  }
}

import Foundation
import QuartzCore
