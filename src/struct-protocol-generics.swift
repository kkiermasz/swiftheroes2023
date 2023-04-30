protocol Conference {
	func organise()
}
struct SwiftHeroes: Conference {
	func organise() {}
}
let swiftHeroes = SwiftHeroes()
func organise(_ conference: some Conference) {
	conference.organise()
}

organise(swiftHeroes)