private
getPostArgsFromThingsToSearchFor: thingsToSearchForCollection 
	| args |
	args := Dictionary new.
	""
	thingsToSearchForCollection
		do: [:each | 
			| pos | 
			pos := each indexOf: $:.
			pos isZero
				ifFalse: [| key value | 
					key := (each first: pos - 1) withBlanksTrimmed.
					value := (each allButFirst: pos) withBlanksTrimmed.
					(value beginsWith: '*')
						ifTrue: [value := value allButFirst].
					(value endsWith: '*')
						ifTrue: [value := value allButLast].
					""
					args at: key put: {value}]].
	""
	^ args