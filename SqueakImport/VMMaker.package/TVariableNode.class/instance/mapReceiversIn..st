transformations
mapReceiversIn: aDictionary
	"Remap the receiver, as when converting a send to objectMemory into a send to self"

	aDictionary
		at: name
		ifPresent: [:newName | name := newName]
