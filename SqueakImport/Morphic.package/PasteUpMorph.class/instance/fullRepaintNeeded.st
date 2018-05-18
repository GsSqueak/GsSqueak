world state
fullRepaintNeeded

	worldState doFullRepaint.
	SystemWindow windowsIn: self
		satisfying: [:w | w makeMeVisible. false].

