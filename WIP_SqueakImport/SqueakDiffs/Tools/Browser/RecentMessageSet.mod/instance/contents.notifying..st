contents
contents: c notifying: n
	| result |
	result := super contents: c notifying: n.
	result == true ifTrue:
		[self reformulateList].
	^ result