evaluating
value
	"Answer the result of evaluating the elements of the receiver.
	Actually, return just the last result."

	^self inject: nil into: [ :previousAnswer :each | 
		each valueOtherwise: [ previousAnswer ]].