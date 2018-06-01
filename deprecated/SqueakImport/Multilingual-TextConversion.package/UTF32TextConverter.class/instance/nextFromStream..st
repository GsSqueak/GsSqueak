conversion
nextFromStream: aStream

	| character1 character2 readBOM charValue character3 character4 |
	aStream isBinary ifTrue: [ ^aStream basicNext ].
	character1 := aStream basicNext ifNil: [ ^nil ].
	character2 := aStream basicNext ifNil: [ ^nil ].
	character3 := aStream basicNext ifNil: [ ^nil ].
	character4 := aStream basicNext ifNil: [ ^nil ].
	
	readBOM := false.
	(character1 asciiValue = 16rFF and: [character2 asciiValue = 16rFE]) ifTrue: [
		self
			useByteOrderMark: true;
			useLittleEndian: true.
		readBOM := true ].
	
	((character1 asciiValue = 0 and: [character2 asciiValue = 0]) 
	and: [character3 asciiValue = 16rFE and: [character4 asciiValue = 16rFF]]) ifTrue: [
		self
			useByteOrderMark: true;
			useLittleEndian: false.
		readBOM := true ].

	readBOM ifTrue: [
		"Re-initialize character variables if they contain BOM"
		character1 := aStream basicNext ifNil: [ ^nil ].
		character2 := aStream basicNext ifNil: [ ^nil ].
		character3 := aStream basicNext ifNil: [ ^nil ].
		character4 := aStream basicNext ifNil: [ ^nil ]. ].

	useLittleEndian 
		ifTrue: [ charValue := (character4 charCode bitShift: 24) + (character3 charCode bitShift: 16) + (character2 charCode bitShift: 8) + character1 charCode ]
		ifFalse: [ charValue := (character1 charCode bitShift: 24) + (character2 charCode bitShift: 16) + (character3 charCode bitShift: 8) + character4 charCode ].

	^ Unicode value: charValue