private
charFromStream: aStream withFirst: firstValue

	| character1 character2 n secondValue |
	(16rD800 <= firstValue and: [firstValue <= 16rDBFF]) ifFalse: [
		^Unicode value: firstValue ].
	character1 := aStream basicNext ifNil: [ ^nil ].
	character2 := aStream basicNext ifNil: [ ^nil ].
	useLittleEndian ifTrue: [
		| tmp |
		tmp := character1.
		character1 := character2.
		character2 := tmp ].
	secondValue := (character1 charCode bitShift: 8) + character2 charCode.
	n := firstValue - 16rD800 * 16r400 + (secondValue - 16rDC00) + 16r10000.
	^Unicode value: n