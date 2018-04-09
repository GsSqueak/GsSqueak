*SqCollectionLiterals-printing
storeOn: aStream
	"Print inside string quotes, doubling embedded quotes."
	| x |
	aStream nextPut: $'.
	1 to: self size do:
		[:i |
		aStream nextPut: (x := self at: i).
		x = $' ifTrue: [aStream nextPut: x]].
	aStream nextPut: $'
