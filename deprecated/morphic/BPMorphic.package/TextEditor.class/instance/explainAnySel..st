explain
explainAnySel: symbol 
	"Is this any message selector?"
	| _gsSqueakTemp_list _gsSqueakTemp_reply |
	_gsSqueakTemp_list := self systemNavigation allClassesImplementing: symbol.
	_gsSqueakTemp_list size = 0
		ifTrue: [^ nil].
	_gsSqueakTemp_list size < 12
		ifTrue: [_gsSqueakTemp_reply := ' is a message selector which is defined in these classes ' , _gsSqueakTemp_list printString]
		ifFalse: [_gsSqueakTemp_reply := ' is a message selector which is defined in many classes'].
	^ '"' , symbol , _gsSqueakTemp_reply , '."' , '\' withCRs , 'SystemNavigation new browseAllImplementorsOf: #' , symbol