preferences
moveMenuButtonRight: aBoolean

	| absLeftOffset |
	absLeftOffset := ((self hideExpandButton and: [aBoolean])
		ifTrue: [absLeftOffset := self boxExtent x * 2]
		ifFalse: [absLeftOffset := self boxExtent x]) + 3.
	self menuBoxFrame leftOffset: (aBoolean 
										ifTrue: [absLeftOffset negated]
										ifFalse: [absLeftOffset]).
	self refreshAllWindows.