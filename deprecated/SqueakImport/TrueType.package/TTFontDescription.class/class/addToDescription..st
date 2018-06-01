instance creation
addToDescription: tt

	| old new |
	old := Descriptions detect: [:f | f first fullName = tt first fullName] ifNone: [nil].
	^ old ifNotNil: [
		new := old, (Array new: ((tt size - old size) max: 0)).
		1 to: tt size do: [:ind |
			(tt at: ind) ifNotNil: [
				new at: ind put: (tt at: ind)
			].
		].
		Descriptions remove: old.
		Descriptions add: new.
		new.
	] ifNil: [
		Descriptions add: tt.
		tt.
	]
