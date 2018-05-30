message list
sortByDate
	"Sort the message-list by date of time-stamp"

	| assocs inOrder |
	assocs := messageList collect:
		[:aRef | | aDate aCompiledMethod |
			aDate := aRef methodSymbol == #Comment
				ifTrue:
					[aRef actualClass organization dateCommentLastSubmitted]
				ifFalse:
					[aCompiledMethod := aRef actualClass compiledMethodAt: aRef methodSymbol ifAbsent: [nil].
					aCompiledMethod ifNotNil: [aCompiledMethod dateMethodLastSubmitted]].
			aRef -> (aDate ifNil: [Date fromString: '01/01/1996'])].  "The dawn of Squeak history"
	inOrder := assocs asArray sort: [:a :b | a value < b value].

	messageList := inOrder collect: [:assoc | assoc key].
	self changed: #messageList