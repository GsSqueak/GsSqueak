accessing
inverseMap
	"Return the inverse map of the receiver"
	| newMasks newShifts |
	colors ifNotNil:[^self error:'Not yet implemented'].
	newMasks := WriteStream on: (Array new: 4).
	newShifts := WriteStream on: (Array new: 4).
	masks with: shifts do:[:mask :shift|
		newMasks nextPut: (mask bitShift: shift).
		newShifts nextPut: shift negated].
	^ColorMap
		shifts: newShifts contents
		masks: newMasks contents