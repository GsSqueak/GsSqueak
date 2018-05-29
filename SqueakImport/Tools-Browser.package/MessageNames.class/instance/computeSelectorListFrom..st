search
computeSelectorListFrom: searchString
	"Compute selector list from search string. The searchString is a list of expressions separated by ;. Each expression is matched individually. An expression can be a simple string (same as *expression*), a string with double quotes (exact match) or a match expression (see String >> #match:)."
	
	^ (Array streamContents: [ :stream |
			(searchString findBetweenSubStrs: ';') do: [ :selPat |
				(selPat first = $" and: [ selPat last = $" and: [ selPat size > 2 ] ])
					ifTrue: [
						Symbol 
							hasInterned: (selPat copyFrom: 2 to: selPat size - 1)
							ifTrue: [ :sym | stream nextPut: sym ] ]
					ifFalse: [
						| raw n m |
						n := selPat occurrencesOf: $*.
						m := selPat occurrencesOf:  $#.
						raw := ((n > 0 or: [ m > 0 ]) 	and: [ selPat size > (n + m) ])
							ifTrue: [ Symbol selectorsMatching: selPat ]
							ifFalse: [ Symbol selectorsContaining: selPat ].
						stream nextPutAll: raw ] ] ]) 
			sort: [ :x :y | x caseInsensitiveLessOrEqual: y ]