error handling
doesNotUnderstand: aMessage 
	"See it the message is a special setter that has not been defined.
	Define it and try again."
	| _gsSqueakTemp_ours |
	_gsSqueakTemp_ours := false.
	(aMessage selector endsWith: 'IncreaseBy:')
		ifTrue: [_gsSqueakTemp_ours := true].
	(aMessage selector endsWith: 'DecreaseBy:')
		ifTrue: [_gsSqueakTemp_ours := true].
	(aMessage selector endsWith: 'MultiplyBy:')
		ifTrue: [_gsSqueakTemp_ours := true].
	_gsSqueakTemp_ours
		ifFalse: [^ super doesNotUnderstand: aMessage].
	(self addSpecialSetter: aMessage selector)
		ifFalse: ["not our inst var"
			^ super doesNotUnderstand: aMessage].
	^ aMessage sentTo: self