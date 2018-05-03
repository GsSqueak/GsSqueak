object format
byteSizeOf: oop
	| slots |
self flag: #Dan.
	(self isIntegerObject: oop) ifTrue:[^0].
	slots := self slotSizeOf: oop.
	(self isBytesNonInt: oop)
		ifTrue:[^slots]
		ifFalse:[^slots * 4]