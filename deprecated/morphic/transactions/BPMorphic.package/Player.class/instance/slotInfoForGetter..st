slots-user
slotInfoForGetter: aGetter 
	"Answer a SlotInformation object which describes an instance variable
	of mine retrieved via the given getter, or nil if none"
	^ self slotInfo
		at: aGetter inherentSelector
		ifAbsent: []