conversion
nextFromStream: aStream

	| character1 character2 readBOM charValue |
	aStream isBinary ifTrue: [ ^aStream basicNext ].
	character1 := aStream basicNext ifNil: [ ^nil ].
	character2 := aStream basicNext ifNil: [ ^nil ].
	
	readBOM := false.
	(character1 asciiValue = 16rFF and: [character2 asciiValue = 16rFE]) ifTrue: [
		self
			useByteOrderMark: true;
			useLittleEndian: true.
		readBOM := true ].
	(character1 asciiValue = 16rFE and: [character2 asciiValue = 16rFF]) ifTrue: [
		self
			useByteOrderMark: true;
			useLittleEndian: false.
		readBOM := true ].

	readBOM ifTrue: [
		character1 := aStream basicNext ifNil: [ ^nil ].
		character2 := aStream basicNext ifNil: [ ^nil ] ].

	useLittleEndian 
		ifTrue: [ charValue := (character2 charCode bitShift: 8) + character1 charCode ]
		ifFalse: [ charValue := (character1 charCode bitShift: 8) + character2 charCode ].

	^ self charFromStream: aStream withFirst: charValue