adjacent splitters
splitterAbove
	| immediatelyAbove |
	immediatelyAbove := nil.
	self siblingSplittersDo:
		[ : each | "Splitter y's map 0 at the bottom."
		each y > self y ifTrue:
			[ immediatelyAbove
				ifNil: [ immediatelyAbove := each ]
				ifNotNil:
					[ each y < immediatelyAbove y ifTrue: [ immediatelyAbove := each ] ] ] ].
	^ immediatelyAbove