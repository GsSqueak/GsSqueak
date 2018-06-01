printing
hhmm24
	"Return a string of the form 1123 (for 11:23 am), 2154 (for 9:54 pm), of exactly 4 digits"

	^(String streamContents: 
		[ :aStream | self print24: true showSeconds: false on: aStream ])
			copyWithout: $:
