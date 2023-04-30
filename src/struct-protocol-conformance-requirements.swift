protocol Conference {
  var numberOfAttendees: Int { get }
}
struct SwiftHeroes: Conference {
  let numberOfAttendees = 0
}
