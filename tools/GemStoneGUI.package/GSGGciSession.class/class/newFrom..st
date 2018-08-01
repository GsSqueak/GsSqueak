instance creation
newFrom: aSessionDescription

	| failed session |
	failed := false.
	[session := GciSession login: aSessionDescription]
		on: Exception
		do: [:exception |
			failed := true.
			exception pass].
	^ failed
		ifTrue: [nil]
		ifFalse: [self gciSession: session]