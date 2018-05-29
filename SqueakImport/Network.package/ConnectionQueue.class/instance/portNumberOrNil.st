public
portNumberOrNil
	"Answer nil while actual port has not been established"
	^ portNumber isCollection
		ifFalse: [portNumber]