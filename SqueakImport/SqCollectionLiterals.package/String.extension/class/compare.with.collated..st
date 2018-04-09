*SqCollectionLiterals-primitives
compare: string1 with: string2 collated: order
	"Return 1, 2 or 3, if string1 is <, =, or > string2, with the collating order of characters given by the order array."

	| c1 c2 length1 length2 |
	length1 := string1 size.
	length2 := string2 size.
	(order == nil or: [ order == AsciiOrder ]) ifTrue: [ "AsciiOrder is the identity function"
		1 to: (length1 min: length2) do: [ :i |
			(c1 := string1 basicAt: i) = (c2 := string2 basicAt: i) ifFalse: [
				c1 < c2
					ifTrue: [ ^1 ]
					ifFalse: [ ^3 ] ] ].
		length1 = length2 ifTrue: [ ^2 ].
		length1 < length2
			ifTrue: [ ^1 ]
			ifFalse: [ ^3 ] ].
	1 to: (length1 min: length2) do: [ :i |
		(c1 := string1 basicAt: i) < 256 ifTrue: [ c1 := order at: c1 + 1 ].
		(c2 := string2 basicAt: i) < 256 ifTrue: [ c2 := order at: c2 + 1 ].
		c1 = c2 ifFalse:[
			c1 < c2 
				ifTrue: [ ^1 ]
				ifFalse: [ ^3 ] ] ].
	length1 = length2 ifTrue: [ ^2 ].
	length1 < length2
		ifTrue: [ ^1 ]
		ifFalse: [ ^3 ].
