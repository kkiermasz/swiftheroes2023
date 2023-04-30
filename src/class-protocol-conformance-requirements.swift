protocol Conference {
  var numberOfAttendees: Int { get }
}
class SwiftHeroes: Conference {
  let numberOfAttendees = 0
}
