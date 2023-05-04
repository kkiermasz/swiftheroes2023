class Building {
  var name: String { UUID().uuidString }
}

class House: Building {
  override var name: String { UUID().uuidString }
}

class Bungalow: House {
  override var name: String { UUID().uuidString }
}

let buildingTime = timeOfRun(Building()) { data in
  for _ in 0..<1000000 {
    _ = data.name.count
  }
}

let houseTime = timeOfRun(House()) { data in
  for _ in 0..<1000000 {
    _ = data.name.count
  }
}

let bungalowTime = timeOfRun(Bungalow()) { data in
  for _ in 0..<1000000 {
    _ = data.name.count
  }
}

print("building function calls time is: \(buildingTime)")
print("house function calls time is:    \(houseTime)")
print("bungalow function calls time is: \(bungalowTime)")

func timeOfRun<BuildingType: Building>(_ data: BuildingType, _ function: (_ data: BuildingType) -> ()) -> Double {
  let timeBefore = CACurrentMediaTime()
  function(data)
  return CACurrentMediaTime() - timeBefore
}

import Foundation
import QuartzCore
