shared flaps
globalFlapTabsWithID: aFlapID 
	"Answer all flap tabs whose ids start with the given id"
	^ self globalFlapTabsIfAny
		select: [:aFlapTab | aFlapTab flapID = aFlapID
				or: [FlapTab givenID: aFlapTab flapID matches: aFlapID]
			"Flaps globalFlapTabsWithID: 'Stack Tools'"]