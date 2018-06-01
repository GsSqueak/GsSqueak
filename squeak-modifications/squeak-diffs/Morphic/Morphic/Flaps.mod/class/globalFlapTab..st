shared flaps
globalFlapTab: aName
	"Answer the global flap tab in the current system whose flapID is the same as aName, or nil if none found."

	| idToMatch |
	idToMatch := (aName beginsWith: 'flap: ')
		ifTrue:  "Ted's old scheme; this convention may still be found
				in pre-existing content that has been externalized"
			[aName copyFrom: 7 to: aName size]
		ifFalse:
			[aName].

	^ self globalFlapTabsIfAny detect: [:ft | ft flapID = idToMatch] ifNone: [nil]