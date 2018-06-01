explain
explainAnySel: symbol 
	"Is this any message selector?"

	| list reply |
	list := self systemNavigation allClassesImplementing: symbol.
	list size = 0 ifTrue: [^nil].
	list size < 12
		ifTrue: [reply := ' is a message selector which is defined in these classes ' , list printString]
		ifFalse: [reply := ' is a message selector which is defined in many classes'].
	^'"' , symbol , reply , '."' , '\' withCRs, 'SystemNavigation new browseAllImplementorsOf: #' , symbol