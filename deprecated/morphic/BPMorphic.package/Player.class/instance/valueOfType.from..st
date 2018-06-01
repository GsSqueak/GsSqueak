slots-user
valueOfType: aType from: oldValue 
	"The user has changed a slot's type to aType; convert its former value,
	oldValue, to something of the appropriate type. For now, does not
	take oldValue into account"
	^ self initialValueForSlotOfType: aType