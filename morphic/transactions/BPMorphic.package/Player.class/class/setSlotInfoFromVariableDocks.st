variable docks
setSlotInfoFromVariableDocks
	"Get the slotInfo fixed up after a change in background shape. Those
	instance variables that are proactively added by the user will persist,
	whereas those that are automatically generated will be updated"
	self slotInfo copy
		do: [:aSlotInfo | "Remove old automatically-created slots"
			aSlotInfo variableDock
				ifNotNil: [:aDock | slotInfo removeKey: aDock variableName]].
	self variableDocks
		do: [:dock | 
			| newInfo |
			"Generate fresh slots from variable docks"
			newInfo := SlotInformation new type: dock variableType.
			newInfo variableDock: dock.
			slotInfo at: dock variableName asSymbol put: newInfo]