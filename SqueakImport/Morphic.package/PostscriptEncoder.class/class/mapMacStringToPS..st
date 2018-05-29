configuring
mapMacStringToPS: aString

	| copy |
	MacToPSCharacterMappings ifNil: [
		MacToPSCharacterMappings := Array new: 256.
		self macToPSCharacterChart do: [ :pair |
			pair second = 999 ifFalse: [MacToPSCharacterMappings at: pair first put: pair second]
		].
	].
	copy := aString copy.
	copy withIndexDo: [ :ch :index |
		| val |
		(val := ch asciiValue) > 127 ifTrue: [
			| newVal |
			(newVal := MacToPSCharacterMappings at: val) ifNotNil: [
				copy at: index put: newVal asCharacter
			].
		].
	].
	^copy