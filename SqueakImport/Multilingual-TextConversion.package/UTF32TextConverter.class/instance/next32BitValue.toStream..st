private
next32BitValue: value toStream: aStream

	| v1 v2 v3 v4 |
	v1 := (value bitShift: -24) bitAnd: 16rFF.
	v2 := (value bitShift: -16) bitAnd: 16rFF.
	v3 := (value bitShift: -8) bitAnd: 16rFF.
	v4 := (value bitShift: 0) bitAnd: 16rFF.
	useLittleEndian
		ifTrue: [
			aStream 
				basicNextPut: (Character value: v4);
				basicNextPut: (Character value: v3);
				basicNextPut: (Character value: v2);
				basicNextPut: (Character value: v1) ]
		ifFalse: [
			aStream
				basicNextPut: (Character value: v1);
				basicNextPut: (Character value: v2);
				basicNextPut: (Character value: v3);
				basicNextPut: (Character value: v4) ].
