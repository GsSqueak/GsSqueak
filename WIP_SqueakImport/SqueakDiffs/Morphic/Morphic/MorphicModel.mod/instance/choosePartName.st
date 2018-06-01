naming
choosePartName
	"When I am renamed, get a slot, make default methods, move any existing methods.  ** Does not clean up old inst var name or methods**  "

	| old |
	old := slotName.
	super choosePartName.
	slotName ifNil: [^self].	"user chose bad slot name"
	self model: self world model slotName: slotName.
	old isNil
		ifTrue: [self compilePropagationMethods]
		ifFalse: [self copySlotMethodsFrom: old]
	"old ones not erased!"