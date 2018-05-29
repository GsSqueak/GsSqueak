accessing
at: aCharOrInteger
	^glyphTable at: (aCharOrInteger isCharacter ifTrue: [aCharOrInteger charCode] ifFalse: [aCharOrInteger])+1