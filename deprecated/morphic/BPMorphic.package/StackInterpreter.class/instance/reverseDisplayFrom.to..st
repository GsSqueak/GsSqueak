I/O primitive support
reverseDisplayFrom: startIndex to: endIndex 
	"Reverse the given range of Display pixels, rounded to whole word
	boundary. Used to give feedback during VM activities such as
	garbage collection when debugging.
	It is assumed that the given word range falls entirely within the first
	line of the Display."
	| _gsSqueakTemp_wordStartIndex _gsSqueakTemp_wordEndIndex _gsSqueakTemp_primFailCodeValue |
	self postGCUpdateDisplayBits
		ifFalse: [^ self].
	(displayBits = 0
			or: [(objectMemory isImmediate: displayBits asInteger)
					or: [displayDepth <= 0]])
		ifTrue: [^ nil].
	_gsSqueakTemp_wordStartIndex := (startIndex max: 0)
				* displayDepth // 32.
	_gsSqueakTemp_wordEndIndex := (endIndex min: displayWidth)
				* displayDepth // 32.
	displayBits asInteger + (_gsSqueakTemp_wordStartIndex * 4)
		to: displayBits asInteger + (_gsSqueakTemp_wordEndIndex * 4)
		by: 4
		do: [:ptr | 
			| reversed |
			reversed := (objectMemory long32At: ptr)
						bitXor: 4294967295.
			objectMemory long32At: ptr put: reversed].
	_gsSqueakTemp_primFailCodeValue := primFailCode.
	self initPrimCall.
	self
		updateDisplayLeft: 0
		Top: 0
		Right: displayWidth
		Bottom: 1.
	self ioForceDisplayUpdate.
	primFailCode := _gsSqueakTemp_primFailCodeValue