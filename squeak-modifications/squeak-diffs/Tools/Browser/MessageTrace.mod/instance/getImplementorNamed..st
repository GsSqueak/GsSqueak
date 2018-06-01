private accessing
getImplementorNamed: selectorSymbol
	 | allPossibilities |
	allPossibilities := (((self selection compiledMethod messages 
		select: [ :eachSelector | eachSelector beginsWith: selectorSymbol ])
		copyWith: selectorSymbol)
		select: [ :each | (Symbol lookup: each) notNil ])
		asSet asOrderedCollection sort.
	(allPossibilities includes: selectorSymbol) ifTrue:
		[ allPossibilities addFirst: (allPossibilities remove: selectorSymbol) ].
	^allPossibilities size > 1
		ifTrue: 
			[ | selectionIndex |
			selectionIndex := (PopUpMenu labelArray: allPossibilities lines: #(1))
				startUpWithCaption: 
					'Browse implementors of
					which message?'.
			selectionIndex = 0 ifTrue: [ selectorSymbol ] ifFalse: [ allPossibilities at: selectionIndex ] ]
		ifFalse: [ allPossibilities isEmpty
			ifTrue: [ selectorSymbol ]
			ifFalse: [ allPossibilities first ] ]
