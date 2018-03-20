replacement
replaceGlobalFlapwithID: flapID 
	"If there is a global flap with flapID, replace it with an updated one."
	| _gsSqueakTemp_replacement _gsSqueakTemp_tabs |
	(_gsSqueakTemp_tabs := self globalFlapTabsWithID: flapID) size = 0
		ifTrue: [^ self].
	_gsSqueakTemp_tabs
		do: [:tab | self removeFlapTab: tab keepInList: false].
	flapID = 'Stack Tools' translated
		ifTrue: [_gsSqueakTemp_replacement := self newStackToolsFlap].
	flapID = 'Supplies' translated
		ifTrue: [_gsSqueakTemp_replacement := self
						newSuppliesFlapFromQuads: (Preferences eToyFriendly
								ifTrue: [self quadsDefiningPlugInSuppliesFlap]
								ifFalse: [self quadsDefiningSuppliesFlap])
						positioning: #right].
	flapID = 'Tools' translated
		ifTrue: [_gsSqueakTemp_replacement := self newToolsFlap].
	flapID = 'Widgets' translated
		ifTrue: [_gsSqueakTemp_replacement := self newWidgetsFlap].
	flapID = 'Navigator' translated
		ifTrue: [_gsSqueakTemp_replacement := self newNavigatorFlap].
	flapID = 'Squeak' translated
		ifTrue: [_gsSqueakTemp_replacement := self newSqueakFlap].
	_gsSqueakTemp_replacement
		ifNil: [^ self].
	self addGlobalFlap: _gsSqueakTemp_replacement.
	self currentWorld
		ifNotNil: [self currentWorld addGlobalFlaps
			"Flaps replaceFlapwithID: 'Widgets' translated"]