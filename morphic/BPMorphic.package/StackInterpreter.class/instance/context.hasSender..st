internal interpreter access
context: thisCntx hasSender: aContext 
	"Does thisCntx have aContext in its sender chain?
	Cheapo implementation above extant machinery."
	| _gsSqueakTemp_handlerOrNilOrZero |
	_gsSqueakTemp_handlerOrNilOrZero := self
				findMethodWithPrimitive: -1
				FromContext: thisCntx
				UpToContext: aContext.
	^ _gsSqueakTemp_handlerOrNilOrZero = 0