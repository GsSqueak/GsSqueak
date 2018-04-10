variable docks
variableDocks
	"Answer the list of variable docks in the receiver. Initialize the
	variable-dock list if not already done."
	variableDocks
		ifNil: [variableDocks := OrderedCollection new].
	^ variableDocks