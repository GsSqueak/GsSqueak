reading
readHeaderPAM
	"read pam header, not tested"
	| loop |
	tupleType := ''.
	loop := true.
	loop whileTrue:[ | key val tokens line |
		line := self pbmGetLine.
		tokens := line findTokens: ' '.
		tokens size = 2 ifTrue:[
			key := tokens at: 1 asUppercase.
			val := tokens at: 2.
			key caseOf: {
				['WIDTH'] 		-> [cols := val asInteger].
				['HEIGHT'] 		-> [rows := val asInteger].
				['DEPTH'] 		-> [depth := val asInteger].
				['MAXVAL']		-> [maxValue := val asInteger].
				['TUPLETYPE']	-> [tupleType := tupleType, ' ', val].
				['ENDHDR']		-> [loop := false].
			}
		]
	].
	Transcript cr; show: 'PAM file class ', type asString, ' size ', cols asString, ' x ', 
		rows asString, ' maxValue =', maxValue asString, ' depth=', depth asString.
