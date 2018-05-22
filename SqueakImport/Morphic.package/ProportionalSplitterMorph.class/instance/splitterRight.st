adjacent splitters
splitterRight
	| immediateRight |
	immediateRight := nil.
	self siblingSplittersDo:
		[ : each | each x > self x ifTrue:
			[ immediateRight
				ifNil: [ immediateRight := each ]
				ifNotNil:
					[ each x < immediateRight x ifTrue: [ immediateRight := each ] ] ] ].
	^ immediateRight