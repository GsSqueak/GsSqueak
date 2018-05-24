halos and balloon help
transferHalo: event from: formerHaloOwner
	"If my world tries to open on me, pass it on to the next sibling after me."
	
	formerHaloOwner == self world ifTrue: [
		self world submorphsDo: [:m |
			(m ~~ self and: [m fullContainsPoint: event position]) ifTrue: [
				m comeToFront.
				^ m transferHalo: event from: formerHaloOwner]]].