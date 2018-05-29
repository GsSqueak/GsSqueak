for real
allEntries

	| answer |

	answer := self sendToSwikiProjectServer: {
		'action: listallprojects'.
	}.
	(answer beginsWith: 'OK') ifFalse: [^#()].
	^self parseListEntries: answer