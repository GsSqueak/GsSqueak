objects from disk
writeOn: aStream 

	aStream nextInt32Put: self basicSize.

	1 to: self basicSize do: [ :i | | w |
		w := self basicAt: i.
		Smalltalk isLittleEndian
			ifFalse: [ aStream nextNumber: 4 put:  w ]
			ifTrue: [ aStream
				nextPut: (w digitAt: 2);
				nextPut: (w digitAt: 1);
				nextPut: (w digitAt: 4);
				nextPut: (w digitAt: 3) ]].