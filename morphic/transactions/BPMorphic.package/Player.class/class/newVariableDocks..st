variable docks
newVariableDocks: dockList 
	"Set the receiver's variableDocks to be the list provided in dockList.
	Assimilate this new information into the receiver's slotInfo, which
	contains both automatically-generated variables such as the variable
	docks and also explicitly-user-specified variables"
	self variableDocks: dockList.
	self setSlotInfoFromVariableDocks