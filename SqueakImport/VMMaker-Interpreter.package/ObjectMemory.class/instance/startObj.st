gc -- mark and sweep
startObj
	"Start tracing the object 'child' and answer the next action. 
	The object may be anywhere in the middle of being swept 
	itself. See comment in markAndTrace for explanation of 
	tracer state variables."
	| oop header lastFieldOffset |
	<inline: true>
	oop := child.
	(self oop: oop isLessThan: youngStartLocal)
		ifTrue: ["old object; skip it"
			field := oop.
			^ Upward].
	header := self longAt: oop.
	(header bitAnd: self markBit) = 0
		ifTrue: ["unmarked; mark and trace"
			"Do not trace the object's indexed fields if it's a weak class "
			(self isWeakNonInt: oop)
				ifTrue: ["Set lastFieldOffset before the weak fields in the receiver "
					lastFieldOffset := (self nonWeakFieldsOf: oop) << self shiftForWord]
				ifFalse: ["Do it the usual way"
					lastFieldOffset := self lastPointerOf: oop].
			header := header bitAnd: self allButTypeMask.
			header := (header bitOr: self markBit) bitOr: HeaderTypeGC.
			self longAt: oop put: header.
			field := oop + lastFieldOffset.
			^ StartField "trace its fields and class"]
		ifFalse: ["already marked; skip it"
			field := oop.
			^ Upward]