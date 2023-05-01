protocol Testable {
  init()
}

final class TestingClass: Testable {}
struct TestingStruct: Testable {}

func specializedAction<T: Testable>(_ item: T) {
  var array: Array<T> = []
  for _ in 0..<100000 {
    array.append(item)
  }
}

func unspecializedAction(_ item: any Testable) {
  var array: Array<Testable> = []
  for _ in 0..<100000 {
    array.append(item)
  }
}

let unspecializedClassTime = timeOfRun(TestingClass()) { data in unspecializedAction(data) }
let specializedClassTime = timeOfRun(TestingClass()) { data in specializedAction(data) }

let unspecializedStructTime = timeOfRun(TestingStruct()) { data in unspecializedAction(data) }
let specializedStructTime = timeOfRun(TestingStruct()) { data in specializedAction(data) }

print("Unspecialized function calls for class took  \(unspecializedClassTime.formatted)s")
print("Specialized function calls for class took    \(specializedClassTime.formatted)s")
print("Specialized function call for classes is     \((unspecializedClassTime / specializedClassTime).formatted) times faster than unspecialized\n")
print("Unspecialized function calls for struct took \(unspecializedStructTime.formatted)s")
print("Specialized function calls for struct took   \(specializedStructTime.formatted)s")
print("Specialized function call for structs is     \((unspecializedStructTime / specializedStructTime).formatted) times faster than unspecialized\n")


import Foundation
import QuartzCore

func timeOfRun<TestableType: Testable>(_ data: TestableType, _ function: (_ data: TestableType) -> ()) -> Double {
  let timeBefore = CACurrentMediaTime()
  function(data)
  return CACurrentMediaTime() - timeBefore
}

let formatter = NumberFormatter()
formatter.maximumFractionDigits = 6

extension Double {
  var formatted: String {
    String(format: "%f", self)
  }

}
