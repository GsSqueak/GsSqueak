adjacent splitters
splitterLeft
	| immediateLeft |
	immediateLeft := nil.
	self siblingSplittersDo:
		[ : each | each x < self x ifTrue:
			[ immediateLeft
				ifNil: [ immediateLeft := each ]
				ifNotNil:
					[ each x > immediateLeft x ifTrue: [ immediateLeft := each ] ] ] ].
	^ immediateLeft