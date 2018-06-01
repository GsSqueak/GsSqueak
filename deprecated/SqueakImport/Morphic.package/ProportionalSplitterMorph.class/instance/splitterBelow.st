adjacent splitters
splitterBelow
	| immediatelyBelow |
	immediatelyBelow := nil.
	self siblingSplittersDo:
		[ : each | each y < self y ifTrue:
			[ immediatelyBelow
				ifNil: [ immediatelyBelow := each ]
				ifNotNil:
					[ each y > immediatelyBelow y ifTrue: [ immediatelyBelow := each ] ] ] ].
	^ immediatelyBelow