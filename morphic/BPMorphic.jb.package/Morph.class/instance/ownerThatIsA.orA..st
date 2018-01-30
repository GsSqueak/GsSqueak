structure
ownerThatIsA: firstClass orA: secondClass 
	"Return the first enclosing morph that is a kind of one of the two
	classes given, or nil if none"
	^ self
		firstOwnerSuchThat: [:m | (m isKindOf: firstClass)
				or: [m isKindOf: secondClass]]