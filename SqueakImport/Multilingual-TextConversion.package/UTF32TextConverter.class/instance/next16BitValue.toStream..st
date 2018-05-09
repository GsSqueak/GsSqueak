private
next16BitValue: value toStream: aStream

	| v1 v2 |
	v1 := (value bitShift: -8) bitAnd: 16rFF.
	v2 := value bitAnd: 16rFF.
	useLittleEndian
		ifTrue: [
			aStream 
				basicNextPut: (Character value: v2);
				basicNextPut: (Character value: v1) ]
		ifFalse: [
			aStream
				basicNextPut: (Character value: v1);
				basicNextPut: (Character value: v2) ].
