shared flaps
globalFlapTabWithID: aFlapID
	"answer the global flap tab with the given id, or nil if none"

	^ self globalFlapTabsIfAny detect: [:aFlapTab | aFlapTab flapID = aFlapID]
		ifNone:
		["Second try allows sequence numbers"
		self globalFlapTabsIfAny detect: [:aFlapTab | FlapTab givenID: aFlapTab flapID matches: aFlapID]
			ifNone: [nil]]