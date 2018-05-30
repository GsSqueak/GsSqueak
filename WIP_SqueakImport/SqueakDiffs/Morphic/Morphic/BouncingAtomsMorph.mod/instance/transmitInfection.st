other
transmitInfection

	| count |
	self collisionPairs do: [:pair | | infected |
		infected := false.
		pair do: [:atom | atom infected ifTrue: [infected := true]].
		infected
			ifTrue: [pair do: [:atom | atom infected: true]]].

	count := 0.
	self submorphsDo: [:m | m infected ifTrue: [count := count + 1]].
	infectionHistory addLast: count.
	count = submorphs size ifTrue: [
		transmitInfection := false.
		self stopStepping].
