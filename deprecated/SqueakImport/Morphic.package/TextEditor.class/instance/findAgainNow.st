typing support
findAgainNow

	| where |	
	where := self text
				findString: FindText
				startingAt: self stopIndex
				caseSensitive: Preferences caseSensitiveFinds.
	
	where = 0
		ifTrue: [self selectFrom: self stopIndex to: self stopIndex - 1]
		ifFalse: [self selectFrom: where to: where + FindText size - 1].

	^ true