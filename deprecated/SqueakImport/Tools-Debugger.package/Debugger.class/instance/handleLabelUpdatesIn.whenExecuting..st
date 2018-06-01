context stack menu
handleLabelUpdatesIn: aBlock whenExecuting: aContext
	"Send the selected message in the accessed method, and regain control 
	after the invoked method returns."
	
	^aBlock
		on: Notification
		do: [:ex|
			(ex tag isArray
			 and: [ex tag size = 2
			 and: [(ex tag first == aContext or: [ex tag first hasSender: aContext])]])
				ifTrue:
					[self labelString: ex tag second description.
					 ex resume]
				ifFalse:
					[ex pass]]