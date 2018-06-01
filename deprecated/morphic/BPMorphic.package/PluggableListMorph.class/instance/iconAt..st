model access
iconAt: anInteger 
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := (self hasFilter
					and: [list notNil])
				ifTrue: [self getFullList
						indexOf: (list
								at: anInteger
								ifAbsent: [^ nil])]
				ifFalse: [anInteger].
	^ getIconSelector
		ifNotNil: [model perform: getIconSelector with: _gsSqueakTemp_index]