constants
lastIndexOfPKSignature: aSignature in: data
	"Answer the last index in data where aSignature (4 bytes long) occurs, or 0 if not found"
	| a b c d |
	a := aSignature first.
	b := aSignature second.
	c := aSignature third.
	d := aSignature fourth.
	(data size - 3) to: 1 by: -1 do: [ :i |
		(((data at: i) = a)
			and: [ ((data at: i + 1) = b)
				and: [ ((data at: i + 2) = c)
					and: [ ((data at: i + 3) = d) ]]])
						ifTrue: [ ^i ]
	].
	^0