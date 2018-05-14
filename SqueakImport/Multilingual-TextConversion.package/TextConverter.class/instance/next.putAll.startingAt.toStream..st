conversion
next: anInteger putAll: aString startingAt: startIndex toStream: aStream
	"Handle fast conversion if ByteString"
	
	| lastIndex nextIndex |
	anInteger > 0 ifFalse: [ ^aString ].
	aStream isBinary ifTrue: [
		aStream basicNext: anInteger putAll: aString startingAt: startIndex.
		^aString ].
	aString class == ByteString ifFalse: [
		startIndex to: startIndex + anInteger - 1 do: [ :index |
			self nextPut: (aString at: index) toStream: aStream ].
		^aString ].
	lastIndex := startIndex.
	[ (nextIndex := ByteString 
		findFirstInString: aString
		inSet: latin1Map
		startingAt: lastIndex) = 0 or: [ anInteger + startIndex <= nextIndex ] ] whileFalse: [ | latin1EncodedCharacter |
			aStream basicNext: nextIndex - lastIndex putAll: aString startingAt: lastIndex.
			latin1EncodedCharacter := latin1Encodings at: (aString byteAt: nextIndex) + 1.
			latin1EncodedCharacter
				ifNil: [UndefinedConversion signalFor: (aString byteAt: nextIndex) toEncoding: self class ]
				ifNotNil: [aStream basicNextPutAll: latin1EncodedCharacter].
			lastIndex := nextIndex + 1 ].
	aStream basicNext: anInteger - lastIndex + startIndex putAll: aString startingAt: lastIndex.
	^aString