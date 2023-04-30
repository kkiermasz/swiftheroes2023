protocol Conference {
  var numberOfAttendees: Int { get }
}
class SwiftHeroes: Conference {
  let numberOfAttendees = 0
}
let swiftHeroes = SwiftHeroes()
final class FinalSwiftHeroes: Conference {
	let numberOfAttendees = 0
}
let finalSwiftHeroes = FinalSwiftHeroes()
func organise(_ conference: some Conference) {
	print("Let's welcome today's \(conference.numberOfAttendees) attendees")
}

organise(swiftHeroes)
organise(finalSwiftHeroes)