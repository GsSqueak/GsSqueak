browse
browseAllCallsOn: literal1 and: literal2 
	"Create and schedule a message browser on each method that calls on the two Symbols, literal1 and literal2."
	"self default browseAllCallsOn: #at: and: #at:put:."

	^self 
		browseMessageList: [ self allCallsOn: literal1 and: literal2 ]
		name: literal1 printString , ' -and- ' , literal2 printString