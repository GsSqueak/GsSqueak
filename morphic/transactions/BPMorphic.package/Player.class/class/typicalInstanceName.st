other
typicalInstanceName
	"For the purpose of documentation, answer the name of a named
	instance of the receiver, if possible, else answer the class name"
	| _gsSqueakTemp_known |
	_gsSqueakTemp_known := (self allInstances
				collect: [:i | i knownName])
				detect: [:n | n isEmptyOrNil not]
				ifNone: [].
	^ _gsSqueakTemp_known
		ifNil: [self name]